#!/bin/zsh

# install command line developer tools
echo
echo "Checking for Command Line Developer Tools..."
if [[ ! -a $(xcode-select -p 2>/dev/null) ]]; then
  echo "Installing Command Line Developer Tools. Follow the actions in the GUI."
  sudo xcode-select --install
  echo "Waiting for tools to be installed. If the operation was cancelled, hit ^C and restart this script."
  while [[ ! -a $(xcode-select -p 2>/dev/null) ]]; do
    sleep 1
  done
  echo "Command Line Developer Tools are now installed!"
else
  echo "Command Line Developer Tools are already installed!"
fi

# install available software updates
echo
echo "Checking for available software updates..."
if softwareupdate -l 2>&1 | grep $Q "No new software available."; then
	echo "Your system is up to date!"
else
	sudo softwareupdate --install --all
fi
