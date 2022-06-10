# Booting

## step 1
### Bootloaders

Desktop
- grub2

Embedded
- U-Boot
Support
    uboot shell,


### Splash screen
Possible in bootloaders, kernel or userspace.
* What?
Bitmaps : ppm (portable pixmap format)
* Where?
U-Boot support splashscreen with bmp
In builders the Yocto Project
Linux(kconfig), in Device Drivers -> Graphics support -> bootup logo
In userspace, from yocto repos 
- Psplash
- EasySplash - Animated splash - https://github.com/OSSystems/EasySplash

#### boot
- uboot supports static bitmaps
- Barebox (https://www.barebox.org/) support png..

#### kernel(linux)
- some basic facilities to load static assets
- boot logo

#### userspace
- at/after init (pid 1).
- during proccess supervision loading phases (systemd, sysvinit, dinit, openrc, s6 ...)
- dynamic

This can be achieve using linux kernel internal framebuffer.
`/usr/bin/fbi -d /dev/fb0 --noverbose -a /to/splash_image.png`

> arch
community repo - fbida





