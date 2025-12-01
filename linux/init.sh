#!/bin/bash

sudo apt update && sudo apt install gpg -y

# Install terraform
if [[ ! -f "/usr/share/keyrings/hashicorp-archive-keyring.gpg" ]]; then
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi

if [[ ! -f "/usr/share/keyrings/debian.griffio.gpg" ]]; then
    curl -sS https://debian.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/debian.griffo.io.gpg
    echo "deb [signed-by=/usr/share/keyrings/debian.griffio.gpg] https://debian.griffo.io/apt bookworm main" | sudo tee /etc/apt/sources.list.d/debian.griffo.io.list
fi

curl -fsSL https://deb.nodesource.com/setup_23.x | sudo bash

sudo apt update && sudo apt install -y vim \
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
    python3-venv \
    nodejs \
    lazygit \
    ghostty \
    tmux

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

if [[ ! -d "$HOME/.go" ]]; then
    current=$(pwd)
    wget -O /tmp/go.tar.gz "https://go.dev/dl/go1.23.5.linux-$(dpkg --print-architecture).tar.gz" || exit 1
    cd /tmp && tar -xzvf go.tar.gz && mv go "$HOME/.go" && cd "$current" || exit 1
fi

if [[ ! -d "$HOME/.zsh/pure" ]]; then
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
fi

if [[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-kubectl-prompt" ]]; then
    git clone https://github.com/superbrothers/zsh-kubectl-prompt.git "$HOME/.oh-my-zsh/custom/plugins/zsh-kubectl-prompt"
fi

# Install neovim dependencies
"$HOME/.go/bin/go" install golang.org/x/tools/gopls@latest
"$HOME/.go/bin/go" install github.com/go-delve/delve/cmd/dlv@latest
"$HOME/.go/bin/go" install github.com/segmentio/golines@latest
sudo npm i -g vscode-langservers-extracted
sudo npm i -g @vue/typescript-plugin
sudo npm i -g @vue/language-server

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
rustup component add rustfmt

wget -O /tmp/delta.deb https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb

git config --global user.name "Henry Whitaker"
git config --global user.email "henrywhitaker3@outlook.com"
git config --global core.excludesFile "$HOME/.gitignore"
git config --global init.defaultBranch main
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
git config --global delta.side-by-side true
curl https://raw.githubusercontent.com/catppuccin/delta/refs/heads/main/catppuccin.gitconfig >"$HOME/.catpuccin.gitconfig"
git config --global include.path "$HOME/.catppuccin.gitconfig"
git config --global delta.features catppuccin-macchiato

echo Cleaning default config file
./common/clean.sh
