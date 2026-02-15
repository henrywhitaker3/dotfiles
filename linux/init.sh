#!/bin/bash

install_task() {
    if [[ ! -d ~/.local/bin ]]; then
        mkdir -p ~/.local/bin
    fi
    if [[ ! -f ~/.local/bin/task ]]; then
        sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
    fi
}

install_homebrew() {
    if [[ ! -d /home/linuxbrew ]]; then
        echo Installing homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo Homebrew already installed
    fi
}

install_ohmyzsh() {
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        echo OhMyZsh already installed
    else
        echo Installing OhMyZsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

install_brew_things() {
    /home/linuxbrew/.linuxbrew/bin/brew bundle install --file ~/.config/Brewfile
}

install_npm_stuff() {
    "/home/linuxbrew/.linuxbrew/bin/npm" i -g @vue/typescript-plugin
    "/home/linuxbrew/.linuxbrew/bin/npm" i -g @vue/language-server
}

install_rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup component add rust-analyzer
    rustup component add rustfmt
}

install_tmux() {
    mkdir -p "$HOME/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
}

sudo apt update && sudo apt install -y git stow zsh python3-pip python3-venv
install_task
install_homebrew
install_ohmyzsh
install_brew_things
install_npm_stuff
install_rust

/home/linuxbrew/.linuxbrew/bin/helm plugin install https://github.com/databus23/helm-diff

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

echo Cleaning up defaults
common/clean.sh
