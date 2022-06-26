#!/bin/zsh

echo
echo "Configuring macOS Preferences..."

apply-user-defaults defaults.yaml

killall Dock
