#!/bin/bash

install_homebrew() {
    which brew > /dev/null
    if [[ $? -ne 0 ]]; then
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
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

install_brew_things() {
    brew install git
    brew install helm
    brew install k9s
    brew install kubectl
    brew install iterm2
    brew install --cask bruno
    brew install pre-commit
    brew install tor-browser
    brew install calibre
    brew install vim
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
    brew install watch
    brew install orbstack
    brew install spotify
    brew install --cask nikitabobko/tap/aerospace
    brew install sops
    brew install fzf
    brew install zsh-autosuggestions
    brew install go-task/tap/go-task
    brew install stow
    brew install ariga/tap/atlas
    brew install sqlc
    brew install --cask firefox
    brew install --cask google-chrome
    brew install visual-studio-code
    brew install grep
}

install_homebrew
install_ohmyzsh
install_brew_things
