DNUMA_VERSION = 0
DNUMA_SITE = $(HOME)/trifles
DNUMA_SITE_METHOD = local

define DNUMA_BUILD_CMDS
	-$(MAKE) -C $(@D) clean
	$(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" debugfs-test
endef

define DNUMA_INSTALL_TARGET_CMDS
	cp $(@D)/debugfs-test $(TARGET_DIR)/usr/bin/dnuma
endef

define DNUMA_CLEAN_CMDS
	-$(MAKE) -C $(@D) clean
endef

$(eval $(generic-package))
