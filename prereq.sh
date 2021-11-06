#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "This script must not be run as root" 
   exit 1
fi

paru --skipreview -S curl neovim-nightly-bin nodejs alacritty go zsh tmux tmux neofetch lldb delve stow

sudo python3 -m pip install --upgrade pynvim
sudo npm install -g neovim
sudo npm install -g yarn

