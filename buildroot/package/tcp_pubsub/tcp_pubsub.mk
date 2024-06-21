################################################################################
#
# tcp_pubsub
#
################################################################################

TCP_PUBSUB_VERSION = v1.0.5
TCP_PUBSUB_SITE = https://github.com/eclipse-ecal/tcp_pubsub
TCP_PUBSUB_SITE_METHOD = git
TCP_PUBSUB_GIT_SUBMODULES = yes
TCP_PUBSUB_LICENSE = MIT
TCP_PUBSUB_LICENSE_FILES = LICENSE
TCP_PUBSUB_INSTALL_STAGING = YES

$(eval $(cmake-package))
