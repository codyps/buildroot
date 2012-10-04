Run the emulation with:

qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda console=ttyS0 numa=fake=2" -nographic

The shell will appear on stdio. Press 'ctrl-a + h' to get qemu help, or
'ctrl-a + x' to exit qemu.
