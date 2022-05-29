#!/bin/bash
git submodule init
git submodule update

if [[ ! $(command -v stow) ]]; then
   echo "stow not installed"
   exit 1
fi

mkdir -p ~/go/bin
mkdir -p ~/go/src/github.com
mkdir -p ~/bin

# -BASHRC
[[ -f ~/.bashrc ]] && rm ~/.bashrc

# -ZSHRC
[[ -f ~/.zshrc ]] && rm ~/.zshrc

# -PROFILE
[[ -f ~/.profile ]] && rm ~/.profile

if [[ -h ~/.config ]] ; then
  echo ".config is symlinked... Exiting!"
  exit 0
fi

[[ ! -d ~/.config ]] && mkdir ~/.config
stow -t ~/ -S config

# Re-link file to prevent error
[[ -f ~/.tmux.conf ]] && rm ~/.tmux.conf
ln -s $(pwd)/config/.tmux/.tmux.conf ~/

