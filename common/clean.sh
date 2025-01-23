#!/bin/bash

delete_if_exists() {
	if [[ -f $1 ]]; then
		rm -r "$1"
	fi
}

delete_if_exists "$HOME/.bashrc"
delete_if_exists "$HOME/.bash_aliases"
delete_if_exists "$HOME/.zshrc"
delete_if_exists "$HOME/.zsh_aliases"
delete_if_exists "$HOME/.config/nvim"
