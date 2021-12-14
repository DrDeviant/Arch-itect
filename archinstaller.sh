#!/bin/bash

exit 69
# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


# vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "3bb28bf1-0b03-4920-92f3-9c61f876c614" >> wakatimeapikey.txt

cd ~/.local/src/dwm ; rm -rf .git/ ; rm config.h
cd ~/.local/src/dmenu ; rm -rf .git/ ; rm config.h
cd ~/.local/src/dwmblocks ; rm -rf .git/ ; rm config.h

cd ~/.local/src/dwm ; sudo make clean install
cd ~/.local/src/dmenu ;  sudo make clean install
cd ~/.local/src/dwmblocks ; sudo make clean install   

cd ~ ; mkdir Documents Pictures Documents Downloads Videos

# git clones
cd Documents ; git clone git@github.com:rdkang/chinguBrightnessChanger ; git clone git@github.com:rdkang/desktopy; git clone git@github.com:rdkang/unistar


rsync -r pc:~/.local/bin/sss/ ~/.local/bin/sss
rsync -r pc:~/.local/bin/statusbar/ ~/.local/bin/statusbar


# enable steam in pacman.conf
vim /etc/pacman.conf # uncomment the mulitlib settings

# intall packages from txt
yay -S --needed - < packages.txt




#python stuff
pip install neovim pygame tinytuya autopep8
# scala -cli
curl -sSLf https://virtuslab.github.io/scala-cli-packages/scala-setup.sh | sh

#anki
rsync -r pc:/home/rdkang/.local/share/Anki2/ .local/share/Anki2


# ranger icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
`echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf`

# betterlockscreen
cd ~/Pictures ; betterlockscreen -u filename.jpg
systemctl enable betterlockscreen@$USER

# to make laptop not sleep when the lid is closed edit 
v /etc/systemd/logind.conf
systemctl restart systemd-logind # to reload the changes
