#!/bin/bash
if [ $# -eq 0 ]; then
  loadkeys uk
  setfont /usr/share/kbd/consolefonts/ter-v28b.psf.gz

  timedatectl set-ntp true

  echo "time to start partioning drives with 'fdisk'"
  exit

else
  if [[ $1 =~ (part2) ]]; then
    echo "executing Part2"
    mkfs.ext4 /dev/$drive1
    # root
    mkfs.ext4 /dev/$drive3
    # home
    mkfs.ext4 /dev/$drive4

    # swap
    mkswap /dev/$drive2
    swapon /dev/$drive2

    ## Mounting
    mkdir -p /mnt/home 
    mkdir -p /mnt/boot
    mount /dev/$drive3 /mnt
    mkdir -p /mnt/boot
    mount /dev/$drive1 /mnt/boot
    mkdir -p /mnt/home
    mount /dev/$drive4 /mnt/home

    pacstrap /mnt base base-devel linux linux-firmware vim neovim


    genfstab -U /mnt >> /mnt/etc/fstab
    cp -r ../arch-itect/ /mnt/root

    echo "use 'arch-chroot /mnt' then run 'bash baseArch.sh part3chroot'"

else
  if [[ $1 =~ (part3) ]]; then
      echo "executing Part3"
      passwd
      pacman -S networkmanager grub terminus-font openssh rsync --noconfirm --needed
      systemctl enable NetworkManager

      grub-install /dev/$drive
      grub-mkconfig -o /boot/grub/grub.cfg

      # uncomment out en_GB in file
      sed -i '/en_GB/s/^#//g' /etc/locale.gen
      locale-gen

      ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
      hwclock --systohc

      echo "archthinkpad" > /etc/hostname
      echo "LANG=en_GB.UTF-8" > /etc/locale.conf
      echo -e "FONT=ter-v28b.psf.gz\nKEYMAP=uk" > /etc/vconsole.conf

      systemctl enable sshd
fi
fi
fi
