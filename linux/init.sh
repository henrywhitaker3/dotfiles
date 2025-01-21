#!/bin/bash

sudo apt update

sudo apt install -y neovim vim wget gcc ripgrep luarocks zsh stow git

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin

if [[ ! -d "$HOME/go" ]]; then
current=$(pwd)
    curl https://go.dev/dl/go1.23.5.linux-amd64.tar.gz -O /tmp/go.tar.gz
    cd /tmp && tar -xzvf go.tar.gz && mv go $HOME/ &&cd $current
fi

echo Cleaning default config file
./common/clean.sh
