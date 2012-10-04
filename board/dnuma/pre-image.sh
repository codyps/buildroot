#! /bin/sh

TARGET_DIR="$1"

echo "debugfs		/sys/kernel/debug	       debugfs    defaults	  0	 0" >>"${TARGET_DIR}/etc/fstab"
