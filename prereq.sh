#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update
apt purge node
apt autoremove

apt install -y git build-essential curl stow unzip zsh fish \
	fonts-firacode tmux ssh exuberant-ctags entr

