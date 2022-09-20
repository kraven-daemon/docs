### https://wiki.gentoo.org/wiki/LiveUSB

To flash an iso to a usb disk for a legacy bootloader =>
the idea here is to install `mtools` (on arch linux) and `syslinux`
on gentoo its
`emerge --ask sys-fs/dosfstools`
`emerge --ask --verbose sys-boot/syslinux`

- plug the usb
- with `fdisk [device]` write msdos partition table
- create a partition
- turn the boot flag on
- write the partition with a fat32 filesystem `mkfs.fat -F 32 /dev/sdc1`
- write the boot loader for the mbr (on arch linux its not in `/usr/share/syslinux/mbr.bin` its under /usr/lib/....)
- mount the iso `mount -o loop,ro -t iso9660 /path/to/isofile.iso /mnt/cdrom`
- mount the usb `mount -t vfat /dev/sdc1 /mnt/usb`
- copy the files `cp -r /mnt/cdrom/* /mnt/usb`
- root the bootfiles on the usb `mv /mnt/usb/isolinux/* /mnt/usb`
- rename iso to sys `mv /mnt/usb/isolinux.cfg /mnt/usb/syslinux.cfg`
- remove them `rm -rf /mnt/usb/isolinux*`
- rename memtest `mv /mnt/usb/memtest86 /mnt/usb/memtest`
- format the syslinux configuration file `sed -i -e "s:cdroot:cdroot slowusb:" -e "s:kernel memtest86:kernel memtest:" /mnt/usb/syslinux.cfg`
- unmount the usb,and iso
- install the bootloader `syslinux /dev/sdc1`
