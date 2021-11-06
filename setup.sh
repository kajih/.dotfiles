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

stow -t ~/ -S config
ln -s $(pwd)/config/.tmux/.tmux.conf ~/

