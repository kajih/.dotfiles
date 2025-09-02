#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update

# old version and deps in Kali conflicts
apt purge node
apt autoremove

curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -

apt install -y git build-essential curl stow unzip zsh python3-pip \
	fonts-firacode tmux ssh python3-pip exuberant-ctags entr

# not updated
# add-apt-repository -y -n ppa:mmstick76/alacritty
# add-apt-repository -y -u ppa:longsleep/golang-backports
# add-apt-repository -y -n ppa:aslatter/ppa
# add-apt-repository -y -n ppa:neovim-ppa/unstable

# Split so if one fails, the others can continue, and easy to update
apt update
# apt install -y alacritty 
# apt install -y neovim
# apt install -y golang-go
	
python3 -m pip install --upgrade pynvim neovim-remote

# npm install -g npm-check-updates
# npm install -g neovim
# npm install -g yarn
#
# snap install starship

