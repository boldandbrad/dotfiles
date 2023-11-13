#!/bin/zsh

################################################################
# macos/install_packages.sh - install macOS packages and apps  #
################################################################
# Install macOS packages and apps from Brewfile.               #
# See brew/Brewfile for a list of packages to be installed.    #
################################################################

# install homebrew
$DOTFILES/scripts/macos/brew/install.sh

# install apps and packages from brewfile via homebrew bundle
echo
echo "Installing macOS apps and packages from Brewfile..."
brew tap homebrew/bundle
if ! brew bundle check; then
  brew bundle install --no-lock --cleanup
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

# TODO: install mas apps from Masfile

echo
echo "Homebrew setup complete!"
