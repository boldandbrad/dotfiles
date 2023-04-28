#!/bin/zsh

echo
echo "Configuring macOS Preferences..."

apply-user-defaults defaults.yaml

killall Dock

defaults write -globalDomain NSUserKeyEquivalents -dict-add "Duplicate Tab" '@k'
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "Duplicate Tab" '@k'
