#!/bin/bash

sudo ./prereq.sh
sudo ./fonts.sh
curl https://mise.run | sh
curl -LsSf https://astral.sh/uv/install.sh | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
./setup.sh

