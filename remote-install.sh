#!/usr/bin/env bash

# intended for remote use. clones this repo and does some basic system setup.
# curl -L https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote-install.sh | bash

REPOSITORY="https://github.com/boldandbrad/dotfiles.git"

DOTFILE_DIR=~/Setup/test-dotfiles

# terminate on errors
set -e

function clone_dotfiles {
  # check for git
  echo -e "Cloning dotfiles\n"
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
    read -p "Do you wish to install the dotfiles now? " yn </dev/tty
    case $yn in
        [Yy]* ) source "$DOTFILE_DIR/install.sh"; break;;
        [Nn]* ) echo -e "\tInstall dotfiles via '. $DOTFILE_DIR/install.sh'"; exit;;
        * ) echo -e "\tPlease answer yes or no.";;
    esac
done
