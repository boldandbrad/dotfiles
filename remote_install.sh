#!/usr/bin/env bash

################################################################
# remote_install.sh - Remotely clone repo and initiate install #
################################################################
# Intended for remote use only. Prompt the user to Clones      #
# dotfiles repo and run install script.                        #
#                                                              #
# OPTIONS:                                                     #
#   --auto-yes: Skip all prompts, and auto-accept all changes  #
#   --no-clear: Don't clear the screen before running          #
#                                                              #
# IMPORTANT: Read and understand contents before running.      #
################################################################

# example usages:
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote_install.sh)"
# or
#  curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote_install.sh | bash

# set variables
PARAMS=$* # user provided parameters
PROMPT_TIMEOUT=15 # When user is prompted for input, skip after x seconds

GITHUB_USER="boldandbrad"
DOTFILE_REPO="https://github.com/${GITHUB_USER}/dotfiles.git"
DOTFILE_DIR=~/Setup/dotfiles

# color Variables
export RESET='\033[0m'
export RED_B='\033[1;31m'
export GREEN_B='\033[1;32m'
export BLUE_B='\033[1;34m'
export PURPLE_B='\033[1;35m'
export PLAIN_B='\033[1;37m'

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
  textColor="${3:-$PLAIN_B}"
  padding="${4:-0}"
  titleLen=$(expr ${#bannerText} + 2 + $padding);
  lineChar="─"; line=""
  for (( i = 0; i < "$titleLen"; ++i )); do line="${line}${lineChar}"; done
  banner="${lineColor}╭${line}╮\n│ ${textColor}${bannerText}${lineColor} │\n╰${line}╯"
  echo -e "\n${banner}\n${RESET}"
}

function pre_setup {
  # welcome banner
  make_banner "${GITHUB_USER}/dotfiles - Remote Install" "${PURPLE_B}" "${PURPLE_B}"

  echo -e "${PURPLE_B}This remote install script will do the following:${RESET}\n"\
  " (1) Clone the ${GITHUB_USER}/dotfiles repo to ${DOTFILE_DIR}\n"\
  " (2) Prompt you to install its contents via 'install.sh'."

  # confirm the user would like to proceed
  echo -en "\n${PURPLE_B}Would you like to continue? (y/N):${RESET} "
  read -t $PROMPT_TIMEOUT -n 1 -r ans_start && echo
  if [[ ! $ans_start =~ ^[Yy]$ ]] && [[ $AUTO_YES != true ]] ; then
    echo -e "\nInstallation canceled. Terminating..."
    exit 0
  fi
}

function clone_dotfiles {
  # confirm the user would like to clone the dotfiles repo
  echo -en "\n${PURPLE_B}Would you like to clone dotfiles to ${DOTFILE_DIR}? (y/N):${RESET} "
  read -t $PROMPT_TIMEOUT -n 1 -r ans_clone && echo
  if [[ ! $ans_clone =~ ^[Yy]$ ]] && [[ $AUTO_YES != true ]] ; then
    echo -e "\nSkipping clone. Please retry or install manually with the steps in the README."
    exit 0
    return
  fi

  # check for git
  echo $'Cloning dotfiles\n'
  if ! type git > /dev/null; then
    echo -e "\n${RED_B}fatal: cannot clone, git not installed.${RESET}"
    exit 1
  fi

  # TODO: check if dotfiles are already cloned

  # clone dotfiles repo
  git clone $DOTFILE_REPO $DOTFILE_DIR
  echo
}

function install_dotfiles {
  # confirm user would like to start install
  echo -en "\n${PURPLE_B}Would you like to start dotfiles install now? (y/N):${RESET} "
  read -t $PROMPT_TIMEOUT -n 1 -r ans_install && echo
  if [[ ! $ans_install =~ ^[Yy]$ ]] && [[ $AUTO_YES != true ]] ; then
    echo -e "\nSkipping install. Install later via '$DOTFILE_DIR/install.sh'"
    return
  fi

  # install dotfiles
  cd $DOTFILE_DIR
  $DOTFILE_DIR/install.sh
}

# terminate on first failure
set -e

# start!
pre_setup
clone_dotfiles
install_dotfiles

set +e
