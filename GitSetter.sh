#!/bin/bash

#rm -r ~/.local/bin/sss*

cd ~/Documents 
git clone git@github.com:rdkang/chinguBrightnessChanger 
git clone git@github.com:rdkang/desktopy
git clone git@github.com:rdkang/unistar
git clone git@github.com:rdkang/Arch-itect
git clone git@github.com:rdkang/cs50

cd


# for the main dotfiles
git branch -m master  main
echo '
[core]
  repositoryformatversion = 0
  filemode = true
  bare = false
  logallrefupdates = true
[submodule]
  active = .
[remote "origin"]
  url = git@github.com:Rdkang/dotfiles.git
  fetch = +refs/heads/main:refs/remotes/origin/main
[branch "main"]
  remote = origin
  merge = refs/heads/main
[submodule ".config/mpv/script_modules/mpvSockets"]
  url = https://github.com/wis/mpvSockets.git
[status]
  showUntrackedFiles = no
' > ~/.git/config

git fetch
git reset --hard origin/main
git pull -f
