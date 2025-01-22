#!/bin/bash

sudo apt update && sudo apt install gpg -y

# Install terraform
if [[ ! -f "/usr/share/keyrings/hashicorp-archive-keyring.gpg" ]]; then
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi

sudo apt update

sudo apt install -y vim \
	wget \
	gcc \
	ripgrep \
	luarocks \
	zsh \
	stow \
	git \
	fzf \
	terraform \
	fonts-firacode \
	make \
	python3 \
	python3-venv

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Install node
curl -fsSL https://deb.nodesource.com/setup_23.x | sudo bash

sudo apt install nodejs -y

if [[ ! -d "$HOME/.go" ]]; then
	current=$(pwd)
	wget -O /tmp/go.tar.gz "https://go.dev/dl/go1.23.5.linux-$(dpkg --print-architecture).tar.gz" || exit 1
	cd /tmp && tar -xzvf go.tar.gz && mv go "$HOME/.go" && cd "$current" || exit 1
fi

"$HOME/.go/bin/go" install golang.org/x/tools/gopls@latest

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo Cleaning default config file
./common/clean.sh
