#!/bin/bash

install_homebrew() {
	which brew >/dev/null
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
	brew install go
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
	brew install gnu-sed
	brew install yq
	brew install jq
	brew install discord
	brew install ansible
	brew install nmap
	brew install zsh-syntax-highlighting
	brew install wget
	brew install pure
	brew install ollama
	brew install pipx
	brew install findutils
	brew install ffmpeg
	brew install mediainfo
	brew install ripgrep
	brew install luarocks
	brew install neovim
	brew install --cask font-fira-code-nerd-font
	brew install delve
	brew install gotests
}

install_iterm_theme() {
	if [[ ! -f "$HOME/.0x96f.itermcolors" ]]; then
		echo Installing 0x96f.itermcolors
		wget https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/0x96f.itermcolors -O $HOME/.0x96f.itermcolors
	fi
}

install_audible() {
	mkdir -p ~/.local/bin

	if [[ ! -f "$HOME/.local/bin/audible" ]]; then
		echo Installing audible-cli
		pipx install audible-cli
	fi
	if [[ ! -f "$HOME/.local/bin/aaxtomp3" ]]; then
		echo Installing aaxtomp3
		wget https://raw.githubusercontent.com/KrumpetPirate/AAXtoMP3/refs/heads/master/AAXtoMP3 -O "$HOME/.local/bin/aaxtomp3"
		chmod +x "$HOME/.local/bin/aaxtomp3"
	fi
}

install_homebrew
install_ohmyzsh
install_brew_things
install_iterm_theme
install_audible

git config --global user.name "Henry Whitaker"
git config --global user.email "henrywhitaker3@outlook.com"
git config --global core.excludesFile "$HOME/.gitignore"

echo Cleaning up defaults
common/clean.sh
