#!/bin/bash
exit 69

# enable steam in pacman.conf
vim /etc/pacman.conf # uncomment the mulitlib settings

echo '
Section "InputClass"
        Identifier "My Mouse"
        Driver "libinput"
        MatchIsPointer "yes"
        Option "AccelProfile" "flat"
EndSection
' > /etc/X11/xorg.conf.d/50-mouse-acceleration.conf


echo '
FONT=ter-v28b.psf.gz
KEYMAP=uk
' > /etc/vconsole.conf
