ifndef $(CC)
CC = aarch64-linux-gcc
endif

ifndef $(DESTDIR)
DESTDIR = /
endif

all: xdma_reg_rw xdma_to_device xdma_from_device xdma_test_chrdev

xdma_to_device: dma_to_device.o
	$(CC) -lrt -o $@ $< -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_LARGE_FILE_SOURCE

xdma_from_device: dma_from_device.o
	$(CC) -lrt -o $@ $< -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_LARGE_FILE_SOURCE

xdma_reg_rw: reg_rw.o
	$(CC) -o $@ $<

xdma_test_chrdev: test_chrdev.o
	$(CC) -o $@ $<

%.o: %.c
	$(CC) -c -std=c99 -o $@ $< -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_LARGE_FILE_SOURCE

install:
	install -t $(DESTDIR)/usr/bin xdma_reg_rw xdma_to_device xdma_from_device xdma_test_chrdev
	install -d $(DESTDIR)/usr/share/xdma
	cp -r ../tests/ $(DESTDIR)/usr/share/xdma/

clean:
	rm -rf *.o *.bin xdma_reg_rw xdma_to_device xdma_from_device xdma_test_chrdev
