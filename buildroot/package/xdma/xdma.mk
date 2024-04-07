################################################################################
#
# xdma
#
################################################################################

XDMA_VERSION = 2020.2.2
XDMA_SITE = $(TOPDIR)/../app/xdma/xdma
XDMA_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
