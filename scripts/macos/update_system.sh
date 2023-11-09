#!/bin/zsh

################################################################
# macos/update_system.sh - update macOS software               #
################################################################
# Install Command Line Developer Tools and available macOS     #
# software updates.                                            #
#                                                              #
# Note: System updates may force a restart. Simply rerun       #
# ./install.sh to continue.                                    #
################################################################

# install command line developer tools
echo -e "\nChecking for Command Line Developer Tools..."
if [[ ! -a $(xcode-select -p 2>/dev/null) ]]; then
  echo "Installing Command Line Developer Tools. Follow the actions in the GUI."
  sudo xcode-select --install
  echo "Waiting for tools to be installed. If the operation was cancelled, hit ^C and restart this script."
  while [[ ! -a $(xcode-select -p 2>/dev/null) ]]; do
    sleep 1
  done
  echo "${GREEN_B}Command Line Developer Tools are now installed!${RESET}"
else
  echo "${GREEN_B}Command Line Developer Tools are already installed!${RESET}"
fi

# install available software updates
# TODO: handle download only case or install only non system updates
echo
echo "Checking for available macOS software updates..."
if softwareupdate -l 2>&1 | grep -q $Q "No new software available."; then
  echo "${GREEN_B}macOS is up-to-date!${RESET}"
else
  echo "Software updates available."
	sudo softwareupdate --install --all --restart
fi
