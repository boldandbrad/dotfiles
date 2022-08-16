#!/bin/zsh

# change default shell to homebrew zsh for future sessions
brew_zsh=/usr/local/bin/zsh
if [[ -f "${brew_zsh}" ]]; then
  chsh -s "${brew_zsh}"
fi
