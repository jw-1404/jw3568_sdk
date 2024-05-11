################################################################################
#
# cc-tutorial
#
################################################################################

CC_TUTORIAL_VERSION = 1.0.0
CC_TUTORIAL_SITE = $(TOPDIR)/../app/cc-tutorial
CC_TUTORIAL_SITE_METHOD = local
CC_TUTORIAL_DEPENDENCIES = cc-comms host-cc-commsdsl

$(eval $(cmake-package))
