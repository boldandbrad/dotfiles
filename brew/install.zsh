#!/bin/zsh

# install homebrew, apps and tools via brew bundle, and perform updates.
echo
if ! type brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit 1
  echo "Homebrew is now installed!"
else
  echo "Homebrew is already installed!"
fi

echo
echo "Setting up Homebrew..."

brew developer off

export PATH=$PATH:/usr/local/bin  # TODO: is this necessary?

if ! brew bundle check; then
  brew bundle install --no-lock --cleanup
fi

brew upgrade
brew cleanup
brew info

echo
echo "Running brew doctor..."
brew doctor

echo
echo "Setting up Homebrew autoupdate..."
if ! brew autoupdate status | grep "running"; then
  brew autoupdate start --cleanup
fi

echo
echo "Homebrew setup complete!"
