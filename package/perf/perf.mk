#############################################################
#
# perf
#
#############################################################

PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))

# Compute PERF_SOURCE and PERF_SITE from the configuration
ifeq ($(PERF_VERSION),custom)
PERF_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
PERF_SITE = $(dir $(PERF_TARBALL))
PERF_SOURCE = $(notdir $(PERF_TARBALL))
else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
PERF_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
PERF_SITE_METHOD = git
else
PERF_SOURCE = linux-$(PERF_VERSION).tar.bz2
# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
# to use the $(word) function. We support versions such as 3.1,
# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
ifeq ($(findstring x2.6.,x$(PERF_VERSION)),x2.6.)
PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
else
PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
endif
# release candidates are in testing/ subdir
ifneq ($(findstring -rc,$(PERF_VERSION)),)
PERF_SITE := $(PERF_SITE)testing/
endif # -rc
endif

PERF_DEPENDENCIES = elfutils

define PERF_BUILD_CMDS
	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" NO_LIBPYTHON=1 NO_LIBPERL=1 NO_DWARF=1 -C $(@D)/tools/perf all
endef

define PERF_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/tools/perf DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
