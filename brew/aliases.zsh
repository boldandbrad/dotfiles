#!/bin/zsh

echo
echo "Setting up Homebrew aliases..."
brew alias check='bundle check -v'
brew alias apply='bundle install'
brew alias prune='bundle cleanup'
brew alias mas="bundle install --file=~/.config/homebrew/Masfile"

echo
echo "Homebrew aliases are setup!"