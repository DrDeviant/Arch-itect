#!/bin/bash

sed -i '2s/^/setxkbmap gb/' ~/.local/bin/remaps
bash ~/.local/bin/remaps

mkdir -p ~/.ssh
cp .sshConfig ~/.ssh/config

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "3bb28bf1-0b03-4920-92f3-9c61f876c614" >> wakatimeapikey.txt

cd ~/.local/src/dwm ; rm -rf .git/ ; rm config.h
cd ~/.local/src/dmenu ; rm -rf .git/ ; rm config.h
cd ~/.local/src/dwmblocks ; rm -rf .git/ ; rm config.h

cd ~ ; mkdir -p Documents Pictures Documents Downloads Videos Music

#python stuff
pip install neovim pygame tinytuya autopep8
# scala -cli
curl -sSLf https://virtuslab.github.io/scala-cli-packages/scala-setup.sh | sh


# ranger icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
`echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf`

# tmux plugins
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -e "finished the general setup\nplease run 'installPackages.sh' next :)"

nvim +PlugInstall +qa
nvim +CocInstall +qa


