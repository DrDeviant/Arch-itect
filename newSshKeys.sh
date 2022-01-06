#!/bin/bash

# https://www.freecodecamp.org/news/git-ssh-how-to/
# https://github.com/settings/keys

if [ $# -eq 0 ]; then
  mkdir -p $HOME/.ssh
  ssh-keygen -t rsa -b 4096 -C thinkpad@arch.com
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  cat ~/.ssh/id_rsa.pub | xclip -sel clip
  cat ~/.ssh/id_rsa.pub > ~/key.txt
  echo -e"done :)\n copy the text from key.txt to https://github.com/settings/keys"

  exit 0 
else
  if [[ $1 =~ (test) ]]; then
    ssh -T git@github.com
    echo -e "wow :)\n now run ssh-copy-id pc"

  fi
fi
