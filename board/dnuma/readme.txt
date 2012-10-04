Run the emulation with:

  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda console=ttyS0" -nographic

The login prompt will appear on stdio. Press 'ctrl-a + h' to get qemu help, or
'ctrl-a + x' to exit qemu.
