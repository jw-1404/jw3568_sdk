################################################################################
#
# ecal
#
################################################################################

ECAL_VERSION = v5.13.2
ECAL_SITE = https://github.com/eclipse-ecal/ecal
ECAL_SITE_METHOD = git
ECAL_GIT_SUBMODULES = yes
ECAL_DEPENDENCIES = iceoryx capnproto termcolor tcp_pubsub ftxui libasio spdlog tclap tinyxml2 flatbuffers
ECAL_LICENSE = Apache-2.0
ECAL_LICENSE_FILES = LICENSE
ECAL_INSTALL_STAGING = YES
ECAL_CONF_OPTS += \
	-DHAS_CAPNPROTO=OFF \
	-DHAS_FLATBUFFERS=OFF \
	-DHAS_HDF5=OFF \
	-DHAS_QT=OFF \
	-DECAL_INSTALL_SAMPLE_SOURCES=OFF \
	-DECAL_LINK_HDF5_SHARED=OFF \
  -DECAL_THIRDPARTY_BUILD_ASIO=OFF \
  -DECAL_THIRDPARTY_BUILD_FTXUI=OFF \
  -DECAL_THIRDPARTY_BUILD_SPDLOG=OFF \
  -DECAL_THIRDPARTY_BUILD_TCLAP=OFF \
  -DECAL_THIRDPARTY_BUILD_TCP_PUBS=OFF \
  -DECAL_THIRDPARTY_BUILD_TERMCOLOR=OFF \
  -DECAL_THIRDPARTY_BUILD_TINYXML2=OFF \
  -DFTXUI_BUILD_DOCS=OFF \

$(eval $(cmake-package))
