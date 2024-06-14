#!/bin/zsh

# setup macOS dock
if type dockutil &>/dev/null; then
  echo
  echo "Configuring macOS Dock..."

  dockutil --no-restart --remove all

  killall Dock

  echo "Dock has been setup!"
fi
