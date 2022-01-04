#!/bin/bash
if [ $# -eq 0 ]; then
  loadkeys uk
  setfont /usr/share/kbd/consolefonts/ter-v28b.psf.gz

  timedatectl set-ntp true

  echo "time to start partioning drives with `fdisk`"
  exit

else
  if [[ $1 =~ (part2) ]]; then
    echo "executing Part2"
    mkfs.ext4 /dev/sda1
    # root
    mkfs.ext4 /dev/sda3
    # home
    mkfs.ext4 /dev/sda4

    # swap
    mkswap /dev/sda2
    swapon /dev/sda2

    ## Mounting
    mkdir /mnt/home /mkdir/boot
    mount /dev/sda3 /mnt
    mkdir /mnt/boot
    mount /dev/sda1 /mnt/boot
    mkdir /mnt/home
    mount /dev/sda4 /mnt/home

    pacstrap /mnt base base-devel linux linux-firmware vim neovim


    genfstab -U /mnt >> /mnt/etc/fstab

    echo "use 'arch-chroot /mnt' then run 'bash baseArch.sh part3chroot'"

else
  if [[ $1 =~ (part3chroot) ]]; then
      echo "executing Part3"
      passwd
      pacman -S networkmanager grub
      systemctl enable NetworkManager

      grub-install /dev/sda
      grub-mkconfig -o /boot/grub/grub.cfg


      # uncomment out en_GB in file
      sed -i '/en_GB/s/^#//g' /etc/locale.gen
      locale-gen

      ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
      hwclock --systohc

      echo "archthinkpad" > /etc/hostname
      echo "LANG=en_US.UTF-8" > /etc/locale.conf
