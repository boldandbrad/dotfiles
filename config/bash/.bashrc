export HISTFILE="${XDG_STATE_HOME}"/bash/history
export SHELL_SESSION_HISTORY=0

# source aliae
if [ -x "$(command -v aliae)" ]; then
  eval "$(aliae init bash --config ~/Setup/dotfiles/config/aliae/aliae.yaml)"
fi

# setup fzf key bindings and fuzzy completions
if [ -x "$(command -v fzf)" ]; then
  eval "$(fzf --bash)"
fi

# initialize zoxide directory hopper
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init --cmd cd bash)"
fi

# initialize shell prompt
if [ -x "$(command -v oh-my-posh)" ]; then
  eval "$(oh-my-posh init bash --config ${XDG_CONFIG_HOME}/oh-my-posh/config.toml)"
fi

. "$CARGO_HOME/env"
