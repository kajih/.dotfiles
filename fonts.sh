#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update
# curl -L https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip -o /tmp/monofont.zip
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -o /tmp/monofont.zip

apt install -y fonts-noto-color-emoji unifont
dpkg-reconfigure fontconfig-config
rm /etc/fonts/conf.d/70-no-bitmaps.conf

# unzip /tmp/monofont.zip -d /usr/share/fonts
unzip /tmp/monofont.zip -d /usr/share/fonts/truetype/nerd/
fc-cache -f -v

