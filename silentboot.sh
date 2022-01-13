#!/bin/bash
source config.txt

#yay -S grub-silent

touch ~/.hushlogin
### sed stuff
#GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_level=3"

#HOOKS=(base udev autodetect modconf block filesystems keyboard fsck) --> HOOKS=(base systemd autodetect modconf block filesystems keyboard fsck)
## need better way

#systemctl edit --full systemd-fsck-root.service
# systemctl edit --full systemd-fsck@.service

#[Service]
#Type=oneshot
#RemainAfterExit=yes
#ExecStart=/usr/lib/systemd/systemd-fsck
#StandardOutput=null
#StandardError=journal+console
#TimeoutSec=0

echo "kernel.printk = 3 3 3 3" > /etc/sysctl.d/20-quiet-printk.conf
mkinitcpio -P


grub-install /dev/$drive
grub-mkconfig -o /boot/grub/grub.cfg

