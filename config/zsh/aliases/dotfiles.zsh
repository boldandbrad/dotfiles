################################################################
# dotfiles.zsh - aliases related system/dotfile maintanence    #
################################################################
# -> dotbot symlinks this file into ~/.config/zsh/aliases/     #
#                                                              #
# Sourced from .zshrc                                          #
# Setup dotfile zsh aliases.                                   #
################################################################

SYSTEM_TYPE=$(uname -s) # system type - Linux / MacOS (Darwin)

################################################################
# macOS specific                                               #
################################################################

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  alias dep-check="brew bundle check -v" # check that all brewfile deps are installed
  alias dep-refresh="brew bundle install" # install all brewfile deps
  alias dep-prune="brew bundle cleanup" # remove all brew managed deps not specified in brewfile
fi
