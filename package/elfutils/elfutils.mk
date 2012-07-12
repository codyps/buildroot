#############################################################
#
# elfutils
#
#############################################################

ELFUTILS_VERSION = 0.154
ELFUTILS_SOURCE = elfutils-$(ELFUTILS_SOURCE).tar.bz2
ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)

ELFUTILS_INSTALL_STAGING = YES

$(eval $(call AUTOTARGET))
