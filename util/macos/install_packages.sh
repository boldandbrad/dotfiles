#!/bin/zsh

################################################################
# macos/install_packages.sh - install macOS packages and apps  #
################################################################
# Install macOS packages and apps from Brewfile.               #
# See brew/Brewfile for a list of packages to be installed.    #
################################################################

# install homebrew if not already installed
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

# install apps and packages from brewfile via homebrew bundle
echo
echo "Installing macOS apps and packages from Brewfile..."
brew tap homebrew/bundle
if ! brew bundle check; then
  brew bundle install --cleanup
fi

# perform upgrades and cleanup
if [[ ! -z "${CI}" ]]; then
  brew upgrade
fi
brew cleanup
brew info

# check for warnings and deprecations
echo
echo "Running brew doctor..."
brew doctor

echo
echo "Homebrew setup complete!"
