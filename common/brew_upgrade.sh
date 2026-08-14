#!/bin/bash

cd ~/code/dotfiles/ || exit 1
mise bootstrap packages upgrade
brew update && brew upgrade -g
