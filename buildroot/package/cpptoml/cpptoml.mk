################################################################################
#
# cpptoml
#
################################################################################

CPPTOML_VERSION = v0.4.0
CPPTOML_SITE = $(TOPDIR)/../app/cpptoml
CPPTOML_SITE_METHOD = local
CPPTOML_LICENSE = MIT
CPPTOML_LICENSE_FILES = LICENSE
CPPTOML_INSTALL_STAGING = YES

$(eval $(cmake-package))
