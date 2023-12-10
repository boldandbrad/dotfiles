#!/bin/zsh

################################################################
# install.sh - install Homebrew                                #
################################################################
# Install Homebrew if not already installed, configure         #
# Homebrew settings and aliases.                               #
################################################################

# install homebrew
echo -e "\nChecking for Homebrew..."
if ! type brew &>/dev/null; then
  echo "Installing Homebrew..."
  # nosemgrep
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit 1
  echo -e "${GREEN_B}Homebrew is now installed!${RESET}"
else
  echo -e "${GREEN_B}Homebrew is already installed!${RESET}"
fi

# configure homebrew
brew developer off
brew analytics off

# setup homebrew aliases
echo -e "\nSetting up Homebrew aliases..."
brew tap homebrew/aliases
brew alias mas="bundle install --file=~/.config/homebrew/Masfile"
echo -e "${GREEN_B}Homebrew aliases are setup!${RESET}"
