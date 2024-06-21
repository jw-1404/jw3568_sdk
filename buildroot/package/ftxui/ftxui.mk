################################################################################
#
# ftxui
#
################################################################################

FTXUI_VERSION = 5.0.0
FTXUI_SITE = $(call github,ArthurSonzogni,ftxui,v$(FTXUI_VERSION))
FTXUI_LICENSE = MIT
FTXUI_LICENSE_FILES = LICENSE
FTXUI_INSTALL_STAGING = YES

$(eval $(cmake-package))
