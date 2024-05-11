################################################################################
#
# sniper
#
################################################################################

SNIPER_VERSION = 2.2.3
SNIPER_SITE = $(TOPDIR)/../app/sniper
SNIPER_SITE_METHOD = local
SNIPER_INSTALL_STAGING = YES
SNIPER_CONF_OPTS = -DUSE_ROOT=OFF -DUSE_PYTHON=OFF -DBUILD_TESTS=ON
SNIPER_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
