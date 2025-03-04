################################################################################
#
# jw-dpu
#
################################################################################

JW_DPU_VERSION = v0.0.1
JW_DPU_SITE = $(TOPDIR)/../app/jw-dpu
JW_DPU_SITE_METHOD = local
JW_DPU_DEPENDENCIES = libmodbus boost libaio

$(eval $(cmake-package))
