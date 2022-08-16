#!/bin/zsh

# setup or validate a new macOS env

# quit on first failure
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
  dotbot -c $DOTFILES/install.conf.yaml

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

set +e
