#############################################################
#
# cryptsetup
#
#############################################################

CRYPTSETUP_VERSION = v1_6_1
CRYPTSETUP_SITE = https://code.google.com/p/cryptsetup/
CRYPTSETUP_SITE_METHOD = git
CRYPTSETUP_LICENSE = GPLv2+
CRYPTSETUP_LICENSE_FILES = COPYING

CRYPTSETUP_LIBTOOL_PATCH = YES
CRYPTSETUP_AUTORECONF = YES
CRYPTSETUP_AUTORECONF_OPT = -vfi

CRYPTSETUP_DEPENDENCIES += libgcrypt host-gettext host-pkgconf lvm2 util-linux

define CRYPTSETUP_PATCH_M4
	mkdir -p $(@D)/m4
endef

CRYPTSETUP_POST_PATCH_HOOKS += CRYPTSETUP_PATCH_M4


$(eval $(autotools-package))
