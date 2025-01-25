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

brew_install() {
	/opt/homebrew/bin/brew install "$1"
}

brew_install_cask() {
	/opt/homebrew/bin/brew install --cask "$1"
}

brew_tap() {
	/opt/homebrew/bin/brew tap "$1"
}

install_brew_things() {
	brew_install git
	brew_install alt-tab
	brew_install helm
	brew_install age
	brew_install k9s
	brew_install kubectl
	brew_install iterm2
	brew_install_cask bruno
	brew_install pre-commit
	brew_install tor-browser
	brew_install calibre
	brew_install vim
	brew_install go
	brew_install 1password
	brew_tap hashicorp/tap
	brew_install hashicorp/tap/terraform
	brew_install watch
	brew_install orbstack
	brew_install spotify
	brew_install_cask nikitabobko/tap/aerospace
	brew_install sops
	brew_install fzf
	brew_install zsh-autosuggestions
	brew_install go-task/tap/go-task
	brew_install stow
	brew_install ariga/tap/atlas
	brew_install sqlc
	brew_install_cask firefox
	brew_install_cask google-chrome
	brew_install visual-studio-code
	brew_install grep
	brew_install gnu-sed
	brew_install yq
	brew_install jq
	brew_install discord
	brew_install ansible
	brew_install nmap
	brew_install_cask wireshark
	brew_install zsh-syntax-highlighting
	brew_install wget
	brew_install pure
	brew_install ollama
	brew_install pipx
	brew_install findutils
	brew_install ffmpeg
	brew_install mediainfo
	brew_install ripgrep
	brew_install luarocks
	brew_install neovim
	brew_install_cask font-fira-code-nerd-font
	brew_install delve
	brew_install gotests
	brew_install golines
	brew_install npm
	brew_install typescript
	brew_install vscode-langservers-extracted
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

install_homebrew
install_ohmyzsh
install_brew_things
install_audible

git config --global user.name "Henry Whitaker"
git config --global user.email "henrywhitaker3@outlook.com"
git config --global core.excludesFile "$HOME/.gitignore"
git config --global init.defaultBranch main
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub

echo Cleaning up defaults
common/clean.sh
