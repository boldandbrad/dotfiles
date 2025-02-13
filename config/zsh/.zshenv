################################################################
# .zshenv - env, aliae, and path setup                         #
################################################################
# -> symlinked to ~/.zshenv                                    #
#                                                              #
# Executed when a new ZSH session is launched.                 #
################################################################

export DOTFILES=$HOME/Dotfiles

if (( $+commands[aliae] )); then
  eval "$(aliae init zsh --config $DOTFILES/config/aliae/aliae.yaml)"
fi

. "$CARGO_HOME/env"
