#!/bin/bash

# uncomment the multlib repo
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Sy --noconfirm

locale-gen

echo '
Section "InputClass"
        Identifier "My Mouse"
        Driver "libinput"
        MatchIsPointer "yes"
        Option "AccelProfile" "flat"
EndSection
' > /etc/X11/xorg.conf.d/50-mouse-acceleration.conf


mkdir -p /mnt/sambacker



#systemctl enable cronie.service
#systemctl enable betterlockscreen@$USER

#cd ~/.local/src/dwm ; sudo make clean install
#cd ~/.local/src/dmenu ;  sudo make clean install
#cd ~/.local/src/dwmblocks ; sudo make clean install   
