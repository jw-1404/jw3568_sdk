################################################################################
#
# xdma
#
################################################################################

XDMA_VERSION = 2020.2.2
XDMA_SITE = $(TOPDIR)/../app/xdma-lite/xdma-lite
XDMA_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
