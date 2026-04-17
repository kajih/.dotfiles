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

# -FISH (only if it's a real file, not already a symlink from a previous stow)
[[ -f ~/.config/fish/config.fish && ! -L ~/.config/fish/config.fish ]] && rm ~/.config/fish/config.fish

if [[ -h ~/.config ]] ; then 
  echo ".config is symlinked... Exiting!"
  exit 0
fi

[[ ! -d ~/.config ]] && mkdir ~/.config

stow -t ~/ -S config

