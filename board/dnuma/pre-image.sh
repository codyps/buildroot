#! /bin/sh

TARGET_DIR="$1"

sed -i 's~ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL~ttyS0::respawn:/bin/login -f root # GENERIC_SERIAL~' ${TARGET_DIR}/etc/inittab
echo "debugfs		/sys/kernel/debug	       debugfs    defaults	  0	 0" >>"${TARGET_DIR}/etc/fstab"
