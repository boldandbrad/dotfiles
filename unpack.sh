#!/usr/bin/env bash

# ------------------------------------------------------------ #
# unpack.sh - all-in-one mac setup script                      #
# ------------------------------------------------------------ #
# Check compatibility, then prompt to install packages,        #
# symlink dotfiles, and configure system.                      #
#                                                              #
# OPTIONS:                                                     #
#   --auto-yes: Skip all prompts, and auto-accept all changes  #
#   --no-clear: Don't clear the screen before running          #
# ------------------------------------------------------------ #

PARAMS=$*
SYSTEM_TYPE=$(uname -s)
export PROMPT_TIMEOUT=15

export DOTFILES=~/Dotfiles
export GITHUB_USER="boldandbrad"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  export HOMEBREW_BUNDLE_FILE="$DOTFILES/util/macos/brew/Brewfile"
  export PATH="/opt/homebrew/bin:$PATH"
fi

export RESET='\033[0m'
export RED_B='\033[1;31m'
export GREEN_B='\033[1;32m'
export BLUE_B='\033[1;34m'
export PURPLE_B='\033[1;35m'
export PLAIN_B='\033[1;37m'
export YELLOW_B='\033[1;93m'
GREEN='\033[0;32m'

if [[ ! $PARAMS == *"--no-clear"* ]] && [[ ! $PARAMS == *"--help"* ]] ; then
  clear
fi

if [[ $PARAMS == *"--help"* ]] ; then
  echo -e "usage: ./unpack.sh [--help] [--auto-yes] [--no-clear]\n\n"\
  "Prompt the user to check system compatibility, install packages and apps, symlink dotfiles, and configure system.\n\n"\
  "OPTIONS:\n"\
  "\t--auto-yes\tSkip all prompts, and auto accept all changes\n"\
  "\t--no-clear\tDon't clear the screen before running\n"\
  "\t--help\t\tPrint this message and exit"
  exit 0
fi

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
  make_banner "${GITHUB_USER}/dotfiles - Install" "${BLUE_B}" "${BLUE_B}"
  echo -e "${BLUE_B}This install script will do the following:${RESET}\n"\
  "(1) Verify system compatibility and check for updates\n"\
  "(2) Install packages and apps\n"\
  "(3) Symlink dotfiles into place\n"\
  "(4) Apply system configurations\n"\
  "${PURPLE_B}For more info, see GitHub: \033[4;35mhttps://github.com/${GITHUB_USER}/dotfiles${RESET}\n"

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
  echo -e "\nChecking for system compatibility..."
  if [ "$SYSTEM_TYPE" == "Darwin" ]; then
    echo -e "${GREEN_B}System is compatible. Continuing...${RESET}"
  else
    echo -e "\n${RED_B}${SYSTEM_TYPE} not supported. Terminating...${RESET}"
    exit 1
  fi

  if [ -z "${CI}" ]; then
    if [[ $AUTO_YES != true ]] ; then
      echo -en "\n${BLUE_B}Would you like to check for updates? (y/N):${RESET} "
      read -t $PROMPT_TIMEOUT -n 1 -r ans_sysupdate && echo
      if [[ ! $ans_sysupdate =~ ^[Yy]$ ]] ; then
        echo -e "\nSkipping system updates."
        return
      fi
    fi

    if [ "$SYSTEM_TYPE" = "Darwin" ]; then
      $DOTFILES/bin/mac update
    fi
  else
    echo -e "\nSkipping system updates. Running in CI."
  fi
}

function install_packages () {
  if [[ $AUTO_YES != true ]] ; then
    echo -en "\n${BLUE_B}Would you like to install/update packages and apps? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_syspackages && echo
    if [[ ! $ans_syspackages =~ ^[Yy]$ ]] ; then
      echo -e "\nSkipping package installs."
      return
    fi
  fi

  if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    $DOTFILES/bin/mac install-deps
  fi
}

function link_dotfiles () {
  if [[ $AUTO_YES != true ]] ; then
    echo -en "\n${BLUE_B}Would you like to install dotfiles? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_symlinks && echo
    if [[ ! $ans_symlinks =~ ^[Yy]$ ]] ; then
      echo -e "\nSkipping dotfile symlinks."
      return
    fi
  fi

  echo -e "\nInstalling dotfiles..."
  eval "$(aliae init zsh --config $DOTFILES/config/aliae/aliae.yaml)"
}

function config_system () {
  if [[ $AUTO_YES != true ]] ; then
    echo -en "\n${BLUE_B}Would you like to perform system-specific configuration? (y/N):${RESET} "
    read -t $PROMPT_TIMEOUT -n 1 -r ans_sysconfig && echo
    if [[ ! $ans_sysconfig =~ ^[Yy]$ ]] ; then
      echo -e "\nSkipping system-specific configuration."
      return
    fi
  fi

  if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    $DOTFILES/util/macos/config_system
  fi
}

# terminate on first failure
set -e

intro
check_system
install_packages
link_dotfiles
config_system

set +e

echo
echo -e "${GREEN_B}Installation and setup complete!${RESET}"
echo -e "${PURPLE_B}Restart for all changes to take effect:${RESET} sudo shutdown -r now"
