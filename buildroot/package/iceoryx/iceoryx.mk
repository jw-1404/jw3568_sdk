################################################################################
#
# iceoryx
#
################################################################################

ICEORYX_VERSION = 2.0.6
ICEORYX_SITE = $(call github,eclipse-iceoryx,iceoryx,v$(ICEORYX_VERSION))
ICEORYX_LICENSE = Apache-2.0
ICEORYX_LICENSE_FILES = LICENSE
ICEORYX_INSTALL_STAGING = YES
ICEORYX_DEPENDENCIES = cpptoml
ICEORYX_SUBDIR = iceoryx_meta
ICEORYX_CONF_OPTS += \
	-DBUILD_TEST=ON \
	-DEXAMPLES=ON \
  -DDOWNLOAD_TOML_LIB=OFF

$(eval $(cmake-package))
