#!/bin/bash

# Size of PCIe DMA transfers that will be used for this test.
# Make sure valid addresses exist in the FPGA when modifying this
# variable. Addresses in the range of 0 - (4 * transferSize) will  
# be used for this test when the PCIe DMA core is setup for memory
# mapped transaction.
transferSize=4096
# Set the number of times each data transfer will be repeated.
# Increasing this number will allow transfers to accross multiple
# channels to over lap for a longer period of time.
transferCount=1

# Determine which Channels are enabled
# Determine if the core is Memory Mapped or Streaming
isStreaming=0
h2cChannels=0
for ((i=0; i<=3; i++)); do
	v=`xdma_reg_rw /dev/xdma0_control 0x0${i}00 w`
	returnVal=$?
	if [ $returnVal -ne 0 ]; then
		break;
	fi

	#v=`echo $v | grep -o  '): 0x[0-9a-f]*'`
	statusRegVal=`xdma_reg_rw /dev/xdma0_control 0x0${i}00 w | grep "Read.*:" | sed 's/Read.*: 0x\([a-z0-9]*\)/\1/'`
	channelId=${statusRegVal:0:3}
	streamEnable=${statusRegVal:4:1}

	if [ $channelId == "1fc" ]; then
		h2cChannels=$((h2cChannels + 1))
		if [ $streamEnable == "8" ]; then
			isStreaming=1
		fi
	fi
done
echo "Info: Number of enabled h2c channels = $h2cChannels"

# Find enabled c2hChannels
c2hChannels=0
for ((i=0; i<=3; i++)); do
	v=`xdma_reg_rw /dev/xdma0_control 0x1${i}00 w`
	returnVal=$?
	if [ $returnVal -ne 0 ]; then
		break;
	fi

	xdma_reg_rw /dev/xdma0_control 0x1${i}00 w | grep "Read.*: 0x1fc" > /dev/null
	statusRegVal=`xdma_reg_rw /dev/xdma0_control 0x1${i}00 w | grep "Read.*:" | sed 's/Read.*: 0x\([a-z0-9]*\)/\1/'`
	channelId=${statusRegVal:0:3}

	# there will NOT be a mix of MM & ST channels, so no need to check
	# for streaming enabled
	if [ $channelId == "1fc" ]; then
		c2hChannels=$((c2hChannels + 1))
	fi
done
echo "Info: Number of enabled c2h channels = $c2hChannels"

# Report if the PCIe DMA core is memory mapped or streaming
if [ $isStreaming -eq 0 ]; then
	echo "Info: The PCIe DMA core is memory mapped."
else
	echo "Info: The PCIe DMA core is streaming."
fi

# Check to make sure atleast one channel was identified
if [ $h2cChannels -eq 0 -a $c2hChannels -eq 0 ]; then
	echo "Error: No PCIe DMA channels were identified."
	exit 1
fi

# Perform testing on the PCIe DMA core.
testError=0
if [ $isStreaming -eq 0 ]; then

	# Run the PCIe DMA memory mapped write read test
	./xdma_memory_mapped_test.sh xdma0 $transferSize $transferCount $h2cChannels $c2hChannels
	returnVal=$?
	 if [ $returnVal -eq 1 ]; then
		testError=1
	fi

else

	# Run the PCIe DMA streaming test
	channelPairs=$(($h2cChannels < $c2hChannels ? $h2cChannels : $c2hChannels))
	if [ $channelPairs -gt 0 ]; then
		./xdma_streaming_test.sh $transferSize $transferCount $channelPairs
		returnVal=$?
		if [ $returnVal -eq 1 ]; then
			testError=1
		fi
	else
		echo "Info: No PCIe DMA stream channels were tested because no h2c/c2h pairs were found."
	fi

fi

# Exit with an error code if an error was found during testing
if [ $testError -eq 1 ]; then
	echo "Error: Test completed with Errors."
	exit 1
fi

# Report all tests passed and exit
echo "Info: All tests in run_tests.sh passed."
exit 0
