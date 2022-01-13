#!/bin/bash
source config.txt

#yay -S grub-silent

touch /home/$user/.hushlogin
### sed stuff
#GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_level=3"

sed -i "s/^HOOKS=(base.*/HOOKS=(base systemd autodetect modconf block filesystems keyboard fsck)/g" /etc/mkinitcpio.conf
mkinitcpio -P
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


#grub-install /dev/$drive
#grub-mkconfig -o /boot/grub/grub.cfg

