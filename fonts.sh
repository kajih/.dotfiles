#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "This script must not be run as root" 
   exit 1
fi

paru --skipreview -S noto-color-emoji-fontconfig ttf-nerd-fonts-symbols-mono nerd-fonts-fira-code nerd-fonts-jetbrains-mono

