DNUMA_VERSION = 0
DNUMA_SITE = $(HOME)/dnuma-progs
DNUMA_SITE_METHOD = local

define DNUMA_BUILD_CMDS
	-$(MAKE) -C $(@D) clean
	$(TARGET_MAKE_OPTS) $(MAKE) -C $(@D)
endef

define DNUMA_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_OPTS) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
endef

define DNUMA_CLEAN_CMDS
	-$(MAKE) -C $(@D) clean
endef

$(eval $(generic-package))
