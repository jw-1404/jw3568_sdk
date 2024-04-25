################################################################################
#
# xdma-tools
#
################################################################################

XDMA_TOOLS_VERSION = v0.0.1
XDMA_TOOLS_SITE = $(TOPDIR)/../app/xdma-tools
XDMA_TOOLS_SITE_METHOD = local

define XDMA_TOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src CC="$(TARGET_CC)" all
endef

define XDMA_TOOLS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
endef

$(eval $(generic-package))
