#!/bin/zsh

# setup or validate a new macOS env

# quit on first failure
set -e

# only macos is supported at this time
if [[ $(uname) == "Darwin" ]]; then
  echo "Setting up new macOS env..."

  export DOTFILES=$(pwd)
  export HOMEBREW_BUNDLE_FILE="$DOTFILES/brew/Brewfile"
  export GH_USER="boldandbrad"

  # install macos command line tools
  $DOTFILES/macos/install.zsh

  # install and setup homebrew
  $DOTFILES/brew/install.zsh

  # install dotfiles
  echo "\nInstalling dotfiles..."
  dotbot -c $DOTFILES/install.conf.yaml

  # setup macOS system preferences
  $DOTFILES/macos/defaults/install.zsh

  # setup macOS dock
  $DOTFILES/macos/dockutil/install.zsh

  # clone repos and forks into ~/Developer
  $DOTFILES/gh/install.zsh

  echo
  echo "Installation and setup complete!"
fi

set +e
