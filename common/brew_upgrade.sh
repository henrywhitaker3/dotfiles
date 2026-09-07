#!/bin/bash

cd ~/code/dotfiles/ || exit 1
MISE_AUTO_ENV=true mise bootstrap packages upgrade
MISE_AUTO_ENV=true mise up
mise run rust
brew update && brew upgrade -g
