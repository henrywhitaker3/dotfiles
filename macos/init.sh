#!/bin/bash

install_homebrew() {
    if [[ ! -f /opt/homebrew/bin/brew ]]; then
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
    brew bundle install --file ~/.config/Brewfile
}

install_audible() {
    mkdir -p ~/.local/bin

    if [[ ! -f "$HOME/.local/bin/audible" ]]; then
        echo Installing audible-cli
        /opt/homebrew/bin/pipx install audible-cli
    fi
    if [[ ! -f "$HOME/.local/bin/aaxtomp3" ]]; then
        echo Installing aaxtomp3
        /opt/homebrew/bin/wget https://raw.githubusercontent.com/KrumpetPirate/AAXtoMP3/refs/heads/master/AAXtoMP3 -O "$HOME/.local/bin/aaxtomp3"
        chmod +x "$HOME/.local/bin/aaxtomp3"
    fi
}

install_npm_stuff() {
    sudo "/opt/homebrew/bin/npm" i -g @vue/typescript-plugin
    sudo "/opt/homebrew/bin/npm" i -g @vue/language-server
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

install_homebrew
install_ohmyzsh
install_brew_things
install_audible
install_npm_stuff
install_rust

/opt/homebrew/bin/helm plugin install https://github.com/databus23/helm-diff

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
