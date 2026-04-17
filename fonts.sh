#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip -o /tmp/monofont.zip
mkdir -p /usr/share/fonts/truetype/nerd/
unzip /tmp/monofont.zip -d /usr/share/fonts/truetype/nerd/

if command -v pacman &>/dev/null; then
    pacman -S --noconfirm noto-fonts-emoji
elif command -v apt &>/dev/null; then
    apt update
    apt install -y fonts-noto-color-emoji unifont
    dpkg-reconfigure fontconfig-config
    rm -f /etc/fonts/conf.d/70-no-bitmaps.conf
else
    echo "Unsupported package manager (expected pacman or apt)"
    exit 1
fi

fc-cache -f -v
