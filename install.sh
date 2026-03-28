#!/bin/bash

sudo ./prereq.sh
sudo ./fonts.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
curl -LsSf https://astral.sh/uv/install.sh | sh
./setup.sh

