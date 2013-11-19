DNUMA_VERSION = 46a2ee0
DNUMA_SITE = https://github.com/jmesmon/dnuma-progs.git
DNUMA_SITE_METHOD = git

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
