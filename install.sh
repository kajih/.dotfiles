#!/bin/bash

sudo ./prereq.sh
sudo ./fonts.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
./setup.sh

