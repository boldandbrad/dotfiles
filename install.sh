#!/usr/bin/env bash

# setup or validate a new env

# terminate on first failure
set -e

# only macOS is supported at this time
if [[ $(uname) == "Darwin" ]]; then
  echo "Setting up new macOS env..."

  export DOTFILES=$(pwd)
  export HOMEBREW_BUNDLE_FILE="$DOTFILES/brew/Brewfile"
  export GH_USER="boldandbrad"

  # install macOS Xcode command line tools
  $DOTFILES/macos/install.zsh

  # install and setup homebrew
  $DOTFILES/brew/install.zsh

  # install dotfiles
  echo "\nInstalling dotfiles..."
  dotbot -c $DOTFILES/symlinks.yaml

  # setup homebrew aliases
  $DOTFILES/brew/aliases.zsh

  # change default shell to homebrew zsh for future sessions
  $DOTFILES/zsh/install.zsh

  # setup macOS system preferences
  $DOTFILES/macos/defaults/install.zsh

  # setup macOS dock
  $DOTFILES/macos/dockutil/install.zsh

  # clone repos and forks into ~/Developer
  $DOTFILES/gh/install.zsh

  # install VSCodium extensions
  $DOTFILES/vscodium/install.zsh

  echo
  echo "Installation and setup complete!"
  echo "Restart for all changes to take effect - sudo shutdown -r now"
fi

if [[ $(uname) == "Linux" ]]; then
  echo "Setting up new linux env..."
  export DOTFILES=$(pwd)
  export GH_USER="boldandbrad"

  # install apps and packages
  $DOTFILES/pi/install.sh

  # install dotfiles
  echo "Installing dotfiles..."
  dotbot -c $DOTFILES/symlinks.yaml
fi

set +e
