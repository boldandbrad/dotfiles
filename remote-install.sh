#!/usr/bin/env bash

# intended for remote use. clones this repo and does some basic system setup.
# curl -L https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote-install.sh | bash

REPOSITORY="https://github.com/boldandbrad/dotfiles.git"

DOTFILE_DIR=~/Setup/test-dotfiles

function clone_dotfiles {
  # check for git
  echo "Cloning dotfiles"
  if ! type git > /dev/null; then
    echo "git not installed."
    exit 1
  fi
  # clone dotfiles repo
  git clone $REPOSITORY $DOTFILE_DIR
}

clone_dotfiles

# prompt to install dotfiles
while true; do
    read -p "Do you wish to install the dotfiles now? " yn
    case $yn in
        [Yy]* ) source "$DOTFILE_DIR/install.sh"; break;;
        [Nn]* ) echo "Install dotfiles via '. $DOTFILE_DIR/install.sh'"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
