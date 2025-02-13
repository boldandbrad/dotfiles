#!/usr/bin/env bash

################################################################
# ship.sh - Remotely clone repo and initiate install           #
################################################################
# Intended for remote use only. Prompt the user to clone       #
# dotfiles repo and to run the install script.                 #
#                                                              #
# OPTIONS:                                                     #
#   --auto-yes: Skip all prompts, and auto-accept all changes  #
#   --no-clear: Don't clear the screen before running          #
#                                                              #
# IMPORTANT: Read and understand contents before running.      #
################################################################

# example usages:
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/ship.sh)"
# or
#  curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/ship.sh | bash

# set variables
PARAMS=$* # user provided parameters
PROMPT_TIMEOUT=15 # When user is prompted for input, skip after x seconds

GITHUB_USER="boldandbrad"
DOTFILE_REPO="https://github.com/${GITHUB_USER}/dotfiles.git"
DOTFILE_DIR=~/Dotfiles

# color ansi escape codes
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
  echo -e "usage: ./ship.sh [--help] [--auto-yes] [--no-clear]\n\n"\
  "Intended for remote use only. Prompt the user to clone dotfiles repo and to run the install script.\n\n"\
  "OPTIONS:\n"\
  "\t--auto-yes\tSkip all prompts, and auto accept all changes\n"\
  "\t--no-clear\tDon't clear the screen before running\n"\
  "\t--help\t\tPrint this message and exit"
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
  " (1) Clone the ${BLUE_B}${GITHUB_USER}/dotfiles${RESET} repo to ${BLUE_B}${DOTFILE_DIR}${RESET}\n"\
  " (2) Prompt you to install its contents via ${BLUE_B}unpack.sh${RESET}\n\n"\
  "${BLUE_B}You will be prompted at each stage, before any changes are made.${RESET}\n"\
  "${BLUE_B}For more info, see GitHub: \033[4;34mhttps://github.com/${GITHUB_USER}/dotfiles${RESET}"

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
  echo -e "\nChecking for git..."
  if ! type git > /dev/null; then
    echo -e "${RED_B}fatal: cannot clone, git not installed.${RESET}"
    exit 1
  else
    echo -e "${GREEN_B}git is installed!${RESET}"
  fi

  echo -e "\nCloning dotfiles..."
  # check if dotfiles dir already exists
  if [ -d "${DOTFILE_DIR}" ]; then
    # check if dotfiles are already cloned
    dotfile_remote=$(cd "${DOTFILE_DIR}"; echo $(git ls-remote --get-url))
    if [ $dotfile_remote == $DOTFILE_REPO ]; then
      echo -e "${GREEN_B}dotfiles already cloned!${RESET}"
      return
    else
      echo -e "${RED_B}fatal - cannot clone, dotfiles directory already exists${RESET}"
      exit 1
    fi
  fi

  # clone dotfiles repo
  git clone $DOTFILE_REPO $DOTFILE_DIR
  echo -e "${GREEN_B}dotfiles cloned!${RESET}"
}

function install_dotfiles {
  # confirm user would like to start install
  echo -en "\n${PURPLE_B}Would you like to start dotfiles install now? (y/N):${RESET} "
  read -t $PROMPT_TIMEOUT -n 1 -r ans_install && echo
  if [[ ! $ans_install =~ ^[Yy]$ ]] && [[ $AUTO_YES != true ]] ; then
    echo -e "\nSkipping install. Install later via ${BLUE_B}$DOTFILE_DIR/unpack.sh${RESET}"
    return
  fi

  # install dotfiles
  cd $DOTFILE_DIR
  $DOTFILE_DIR/unpack.sh
}

# terminate on first failure
set -e

# start!
pre_setup
clone_dotfiles
install_dotfiles

set +e
