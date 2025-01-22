#!/bin/bash

sudo apt update

sudo apt install -y vim wget gcc ripgrep luarocks zsh stow git fzf terraform fonts-firacode

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

if [[ ! -d "$HOME/go" ]]; then
current=$(pwd)
    curl https://go.dev/dl/go1.23.5.linux-amd64.tar.gz -O /tmp/go.tar.gz
    cd /tmp && tar -xzvf go.tar.gz && mv go $HOME/ &&cd $current
fi

echo Cleaning default config file
./common/clean.sh
