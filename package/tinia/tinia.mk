TINIA_VERSION = 0
TINIA_SITE = git@vcr:cody/tinia.git
TINIA_SITE_METHOD = git

define TINIA_INSTALL_TARGET_CMDS
	cp $(@D)/init $(TARGET_DIR)/init
	$(@D)/generate-version > $(TARGET_DIR)/VERSION
endef

$(eval $(generic-package))
