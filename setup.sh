#!/bin/bash
git submodule init
git submodule update

mkdir -p ~/go/bin
mkdir -p ~/go/src/github.com
mkdir -p ~/bin

# -BASHRC
[[ -f ~/.bashrc ]] && rm ~/.bashrc

# -ZSHRC
[[ -f ~/.zshrc ]] && rm ~/.zshrc

# -PROFILE
[[ -f ~/.profile ]] && rm ~/.profile

# - p10k
[[ -f ~/.p10k.zsh ]] && rm ~/.p10k.zsh

if [[ -h ~/.config ]] ; then 
  echo ".config is symlinked... Exiting!"
  exit 0
fi

[[ ! -d ~/.config ]] && mkdir ~/.config

stow -t ~/ -S config
ln -s $(pwd)/config/.tmux/.tmux.conf ~/

