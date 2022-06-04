#!/bin/zsh

# setup or validate a new macOS env

# only macos is supported at this time
if [[ $(uname) == "Darwin" ]]; then
  echo "Setting up new macOS env...\n"

  export DOTFILES=$(pwd)
  export HOMEBREW_BUNDLE_FILE="$DOTFILES/brew/Brewfile"

  # install macos command line tools
  $DOTFILES/macos/install.zsh

  # install and setup homebrew
  $DOTFILES/brew/install.zsh

  # install dotfiles
  echo "\nInstalling dotfiles..."
  dotbot -c $DOTFILES/install.conf.yaml

  # setup system preferences
  $DOTFILES/macos/set-defaults.zsh

  # TODO: clone repos into ~/Developer/repos

  # TODO: move dotfiles dir to ~/Setup/dotfiles and adjust global exports to point to that

  echo
  echo "Installation and setup complete!"
fi
