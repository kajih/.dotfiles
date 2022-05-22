#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update
apt install -y curl

# old version and deps in Kali conflicts
apt purge node
apt autoremove

curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -

add-apt-repository -y -n ppa:mmstick76/alacritty
add-apt-repository -y -n ppa:neovim-ppa/unstable
add-apt-repository -y -u ppa:longsleep/golang-backports

apt install -y stow git build-essential nodejs alacritty neovim golang-go zsh \
	fonts-firacode tmux neofetch ssh python3-pip exuberant-ctags snapd

python3 -m pip install --upgrade pynvim neovim-remote
npm install -g neovim
npm install -g yarn

snap install starship

