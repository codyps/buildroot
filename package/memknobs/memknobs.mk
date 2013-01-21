MEMKNOBS_VERSION = 0
MEMKNOBS_SITE = $(HOME)/g/memknobs
MEMKNOBS_SITE_METHOD = local

define MEMKNOBS_BUILD_CMDS
	-$(MAKE) -C $(@D) clean
	$(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
endef

define MEMKNOBS_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" DESTDIR=$(TARGET_DIR) install
endef

define MEMKNOBS_CLEAN_CMDS
	-$(MAKE) -C $(@D) clean
endef

$(eval $(generic-package))
