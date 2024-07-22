################################################################################
#
# python-supervisor-twiddler
#
################################################################################

PYTHON_SUPERVISOR_TWIDDLER_VERSION = 1.0.0
PYTHON_SUPERVISOR_TWIDDLER_SITE = $(call github,mnaberez,supervisor_twiddler,$(PYTHON_SUPERVISOR_TWIDDLER_VERSION))
PYTHON_SUPERVISOR_TWIDDLER_LICENSE = BSD-3-Clause
PYTHON_SUPERVISOR_TWIDDLER_LICENSE_FILES = LICENSE.txt
PYTHON_SUPERVISOR_TWIDDLER_DEPENDENCIES = supervisor
PYTHON_SUPERVISOR_TWIDDLER_SETUP_TYPE = setuptools

define PYTHON_SUPERVISOR_TWIDDLER_INSTALL_CONF_FILES
	$(INSTALL) -D -m 644 package/python-supervisor-twiddler/twiddler.conf \
		$(TARGET_DIR)/etc/supervisor.d/twiddler.conf
endef

PYTHON_SUPERVISOR_TWIDDLER_POST_INSTALL_TARGET_HOOKS += PYTHON_SUPERVISOR_TWIDDLER_INSTALL_CONF_FILES

$(eval $(python-package))
