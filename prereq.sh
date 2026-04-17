#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

if command -v pacman &>/dev/null; then
    pacman -Syu --noconfirm
    pacman -S --noconfirm git base-devel curl stow unzip zsh fish tmux openssh ctags entr
elif command -v apt &>/dev/null; then
    apt update
    apt purge node
    apt autoremove
    apt install -y git build-essential curl stow unzip zsh fish \
        fonts-firacode tmux ssh exuberant-ctags entr
else
    echo "Unsupported package manager (expected pacman or apt)"
    exit 1
fi
