#!/usr/bin/env bash

################################################################
# tools/set_default_shell.sh - set default shell               #
################################################################
# Changes the default shell to zsh for future sessions.        #
################################################################

# change default shell to zsh for future sessions
# TODO: handle more than just macOS zsh path
brew_zsh=/usr/local/bin/zsh
if [[ -f "${brew_zsh}" ]]; then
  chsh -s "${brew_zsh}"
fi
