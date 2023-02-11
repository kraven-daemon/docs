Swiss army knives

busybox => shell
sox => audio
imagemagick


===== networks =====
ssh, scp, ping, irssi, wget/aria2, and links/w3m
irssi => ??? seams cool

# https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Networking
gentoo uses automatic kernel module loading and configuration(for eth0) at boot.

## if it fails do manual configuration

Ethernet users should continue with Default: Using net-setup
ADSL users should continue with Alternative: Using PPP
PPTP users should continue with Alternative: Using PPTP

##### kernel side
available and loaded
`ls /sys/class/net`
available and not loaded
`ls /lib/modules/$(uname -r)/kernel/drivers/net`
load missing firmware/module
`modprobe module`

##### general status
ifconfig
ip a


##### ethernet
`net-setup eth0`

##### PPP ? PPTP ? , skipping

##### wifi data
https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Networking

show devices
`iw dev`
show info
`iw dev wlp8s0 info`
check connection stats
`iw dev wlp9s0 link`

##### wifi connect
check for software/hardware blocking
`rfkill`
bring interface up
`ip link set dev <device> up`
check for kernel wpa_supplicant 

##### dhcp
```
dhcpcd eth0
# with hostname and domain name
dhcpcd -HD eth0
```
ppp
pptp


