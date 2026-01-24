# ------------------------------------------------------------ #
# zsh env, alias, and path setup                               #
# ------------------------------------------------------------ #

export DOTFILES=$HOME/Dotfiles

export PATH="/opt/homebrew/bin:$PATH"

if (( $+commands[aliae] )); then
  eval "$(aliae init zsh --config $DOTFILES/config/aliae/aliae.yaml)"
fi

. "$CARGO_HOME/env"
