
# https://www.freecodecamp.org/news/git-ssh-how-to/
if [ $# -eq 0 ]; then
  mkdir $HOME/.ssh
  ssh-keygen -t rsa -b 4096 -C thinkpad@arch.com
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  cat ~/.ssh/id_rsa.pub | xclip -sel clip

  exit 0 
else
  if [[ $1 =~ (test) ]]; then
    ssh -T git@github.com

  fi
fi
