#!/bin/bash

sudo apt update && sudo apt install gpg -y

# Install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg /tmp/hashicorp.key
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt install -y vim wget gcc ripgrep luarocks zsh stow git fzf terraform fonts-firacode make

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Install node
curl -fsSL https://deb.nodesource.com/setup_23.x | sudo bash

sudo apt install nodejs -y

if [[ ! -d "$HOME/go" ]]; then
	current=$(pwd)
	curl https://go.dev/dl/go1.23.5.linux-amd64.tar.gz -O /tmp/go.tar.gz
	cd /tmp && tar -xzvf go.tar.gz && mv go "$HOME/" && cd "$current" || exit 1
fi

"$HOME/go/bin/go" install golang.org/x/tools/gopls@latest

echo Cleaning default config file
./common/clean.sh
