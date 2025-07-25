#!/usr/bin/env bash

################################################################
# unpack.sh - All-in-One Install and Setup Script for Unix     #
################################################################
# Prompt the user to check system compatibility, install       #
# packages and apps, symlink dotfiles, and configure system.   #
#                                                              #
# OPTIONS:                                                     #
#   --auto-yes: Skip all prompts, and auto-accept all changes  #
#   --no-clear: Don't clear the screen before running          #
#                                                              #
# IMPORTANT: Read and understand contents before running.      #
################################################################

# set variables
PARAMS=$* # user provided parameters
SYSTEM_TYPE=$(uname -s) # system type - Linux / MacOS (Darwin)
export PROMPT_TIMEOUT=15 # when user is prompted for input, skip after x seconds

export DOTFILES=~/Dotfiles
export GITHUB_USER="boldandbrad"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  export HOMEBREW_BUNDLE_FILE="$DOTFILES/util/macos/brew/Brewfile"
  export PATH="/opt/homebrew/bin:$PATH"
fi

# color ansi escape codes
export RESET='\033[0m'
export RED_B='\033[1;31m'
export GREEN_B='\033[1;32m'
export BLUE_B='\033[1;34m'
export PURPLE_B='\033[1;35m'
export PLAIN_B='\033[1;37m'
export YELLOW_B='\033[1;93m'
GREEN='\033[0;32m'

# clear screen
if [[ ! $PARAMS == *"--no-clear"* ]] && [[ ! $PARAMS == *"--help"* ]] ; then
  clear
fi

# print help
if [[ $PARAMS == *"--help"* ]] ; then
  echo -e "usage: ./unpack.sh [--help] [--auto-yes] [--no-clear]\n\n"\
  "Prompt the user to check system compatibility, install packages and apps, symlink dotfiles, and configure system.\n\n"\
  "OPTIONS:\n"\
  "\t--auto-yes\tSkip all prompts, and auto accept all changes\n"\
  "\t--no-clear\tDon't clear the screen before running\n"\
  "\t--help\t\tPrint this message and exit"
  exit 0
fi

# if auto-yes set, then don't wait for user reply
if [[ $PARAMS == *"--auto-yes"* ]]; then
  export PROMPT_TIMEOUT=1
  export AUTO_YES=true
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

function intro () {
  # welcome banner
  make_banner "${GITHUB_USER}/dotfiles - Install" "${BLUE_B}" "${BLUE_B}"

  # explain to the user what changes will be made
  echo -e "${BLUE_B}This install script will do the following:${RESET}\n"\
  "(1) Verify system compatibility and check for updates\n"\
  "(2) Install packages and apps\n"\
  "(3) Symlink dotfiles into place\n"\
  "(4) Apply system configurations\n"\
  "${PURPLE_B}For more info, see GitHub: \033[4;35mhttps://github.com/${GITHUB_USER}/dotfiles${RESET}\n"

  # confirm the user would like to proceed
  if [[ $AUTO_YES != true ]] ; then
    echo -e "${PURPLE_B}You will be prompted at each stage, before any changes are made.${RESET}\n"
    echo -en "${BLUE_B}Would you like to continue? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_start && echo
    if [[ ! $ans_start =~ ^[Yy]$ ]] ; then
      echo -e "\nInstallation canceled. Terminating..."
      exit 0
    fi
  fi
}

function check_system () {
  # verify system compatibility
  echo -e "\nChecking for system compatibility..."
  if [ "$SYSTEM_TYPE" == "Darwin" ]; then
    echo -e "${GREEN_B}System is compatible. Continuing...${RESET}"
  elif [ "$SYSTEM_TYPE" == "Linux" ]; then
    DISTRO=$(grep ^ID= /etc/os-release | cut -d'=' -f2)
    if [ "$DISTRO" != "alpine" ]; then
      echo -e "\n${RED_B}${DISTRO} not supported. Terminating...${RESET}"
      exit 1
    fi
    return
  else
    echo -e "\n${RED_B}${SYSTEM_TYPE} not supported. Terminating...${RESET}"
    exit 1
  fi

  # confirm the user would like to check for system updates
  if [[ $AUTO_YES != true ]] ; then
    echo -en "\n${BLUE_B}Would you like to check for updates? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_sysupdate && echo
    if [[ ! $ans_sysupdate =~ ^[Yy]$ ]] ; then
      echo -e "\nSkipping system updates."
      return
    fi
  fi

  # check if running in CI
  if [ -z "${CI}" ]; then
    # update macOS system software
    if [ "$SYSTEM_TYPE" = "Darwin" ]; then
      $DOTFILES/util/macos/update_system
    elif [ "$DISTRO" == "alpine" ]; then
      $DOTFILES/util/linux/alpine/update_system.sh
    fi
  else
    echo -e "\nSkipping system updates. Running in CI."
  fi
}

function install_packages () {
  # confirm the user would like to install packages
  if [[ $AUTO_YES != true ]] ; then
    echo -en "\n${BLUE_B}Would you like to install/update packages and apps? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_syspackages && echo
    if [[ ! $ans_syspackages =~ ^[Yy]$ ]] ; then
      echo -e "\nSkipping package installs."
      return
    fi
  fi

  # install macOS packages
  if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    # install macOS packages and apps with homebrew
    $DOTFILES/util/macos/install_packages
  fi
}

function link_dotfiles () {
  # confirm the user would like to symlink dotfiles
  if [[ $AUTO_YES != true ]] ; then
    echo -en "\n${BLUE_B}Would you like to install dotfiles? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_symlinks && echo
    if [[ ! $ans_symlinks =~ ^[Yy]$ ]] ; then
      echo -e "\nSkipping dotfile symlinks."
      return
    fi
  fi

  # symlink dotfiles
  echo -e "\nInstalling dotfiles..."
  eval "$(aliae init zsh --config $DOTFILES/config/aliae/aliae.yaml)"
}

function config_system () {
  # confirm the user would like to perform system configuration
  if [[ $AUTO_YES != true ]] ; then
    echo -en "\n${BLUE_B}Would you like to perform system-specific configuration? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_sysconfig && echo
    if [[ ! $ans_sysconfig =~ ^[Yy]$ ]] ; then
      echo -e "\nSkipping system-specific configuration."
      return
    fi
  fi

  # perform macOS configuration
  if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    $DOTFILES/util/macos/config_system
  fi
}

# terminate on first failure
set -e

# start!
intro
check_system
install_packages
link_dotfiles
config_system

set +e

echo
echo -e "${GREEN_B}Installation and setup complete!${RESET}"
echo -e "${PURPLE_B}Restart for all changes to take effect:${RESET} sudo shutdown -r now"
