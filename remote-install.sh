#!/usr/bin/env bash

# intended for remote use. clones this repo and prompts the user to run install.
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote-install.sh)"
# or
# curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote-install.sh | bash

DOTFILE_REPO="https://github.com/boldandbrad/dotfiles.git"
DOTFILE_DIR=~/Setup/test-dotfiles

# terminate on first failure
set -e

function intro_message {
  echo -e "dotfiles remote installer\n"
  echo -e "This script will clone boldandbrad's dotfiles repo to $DOTFILE_DIR and then prompt you to install its contents.\n"
}

function clone_dotfiles {
  # prompt to clone dotfiles
  while true; do
      read -p "Do you wish to clone the dotfiles repo? " yn </dev/tty
      case $yn in
          [Yy]* ) echo; break;;
          [Nn]* ) echo -e "\tInstall manually following steps in the README."; exit;;
          * ) echo $'\tPlease answer yes or no.';;
      esac
  done

  # check for git
  echo $'Cloning dotfiles\n'
  if ! type git > /dev/null; then
    echo "fatal: git not installed."
    exit 1
  fi

  # clone dotfiles repo
  git clone $DOTFILE_REPO $DOTFILE_DIR
  echo
}

function install_dotfiles {
  # prompt to install dotfiles
  while true; do
      read -p "Do you wish to install the dotfiles now? " yn </dev/tty
      case $yn in
          [Yy]* ) echo; break;;
          [Nn]* ) echo -e "\tInstall dotfiles later via '$DOTFILE_DIR/install.sh'"; exit;;
          * ) echo -e "\tPlease answer yes or no.";;
      esac
  done
  # install dotfiles
  cd $DOTFILE_DIR
  $DOTFILE_DIR/install.sh
}

intro_message
clone_dotfiles
install_dotfiles
