#!/usr/bin/env bash

################################################################
# remote_install.sh - Remotely clone repo and initiate install #
################################################################
# Intended for remote use only. Clones dotfiles repo and       #
# prompts user to start install.                               #
#                                                              #
# OPTIONS:                                                     #
#   --auto-yes: Skip all prompts, and auto-accept all changes  #
#   --no-clear: Don't clear the screen before running          #
#                                                              #
# IMPORTANT: Read and understand contents before running.      #
################################################################

# example usages:
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote_install.sh)"
# or
# curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote_install.sh | bash

# set variables
PARAMS=$* # user provided parameters
PROMPT_TIMEOUT=15 # When user is prompted for input, skip after x seconds

GITHUB_USER="boldandbrad"
DOTFILE_REPO="https://github.com/${GITHUB_USER}/dotfiles.git"
DOTFILE_DIR=~/Setup/dotfiles

# color Variables
export RESET='\033[0m'
export GREEN_B='\033[1;32m'
export BLUE_B='\033[1;34m'
export PURPLE='\033[0;35m'

# clear screen
if [[ ! $PARAMS == *"--no-clear"* ]] && [[ ! $PARAMS == *"--help"* ]] ; then
  clear
fi

# print help
if [[ $PARAMS == *"--help"* ]] ; then
  # TODO: print help message
  echo "help message coming soon..."
  exit 0
fi

function make_banner () {
  bannerText=$1
  lineColor="${2:-$BLUE_B}"
  padding="${3:-0}"
  titleLen=$(expr ${#bannerText} + 2 + $padding);
  lineChar="─"; line=""
  for (( i = 0; i < "$titleLen"; ++i )); do line="${line}${lineChar}"; done
  banner="${lineColor}╭${line}╮\n│ ${PLAIN_B}${bannerText}${lineColor} │\n╰${line}╯"
  echo -e "\n${banner}\n${RESET}"
}

function intro_message {
  # welcome banner
  make_banner "${GITHUB_USER}/dotfiles - Remote Install" "${PURPLE}"

  echo -e "${PURPLE}This remote install script will do the following:${RESET}\n"\
  " (1) Clone the ${GITHUB_USER}/dotfiles repo to ${DOTFILE_DIR}\n"\
  " (2) Prompt you to install its contents via 'install.sh'."
  exit 0
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

# terminate on first failure
set -e

# start!
intro_message
clone_dotfiles
install_dotfiles

set +e
