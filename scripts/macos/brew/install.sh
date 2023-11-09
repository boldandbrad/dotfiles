#!/bin/zsh

################################################################
# install.sh - install Homebrew                                #
################################################################
# Install Homebrew if not already installed, configure         #
# Homebrew settings and aliases.                               #
################################################################

# install homebrew
echo
echo "Checking for Homebrew..."
if ! type brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit 1
  echo "Homebrew is now installed!"
else
  echo "Homebrew is already installed!"
fi

# configure homebrew
brew developer off
brew analytics off

# setup homebrew aliases
echo
echo "Setting up Homebrew aliases..."
brew tap homebrew/aliases
brew alias check='bundle check -v'
brew alias apply='bundle install'
brew alias prune='bundle cleanup'
brew alias mas="bundle install --file=~/.config/homebrew/Masfile"

echo
echo "Homebrew aliases are setup!"
