export HISTFILE="${XDG_STATE_HOME}"/bash/history
export SHELL_SESSION_HISTORY=0

# source aliae
eval "$(aliae init bash --config ~/Dotfiles/config/aliae/aliae.yaml)"

# initialize zoxide directory hopper
eval "$(zoxide init --cmd cd bash)"

# initialize shell prompt
eval "$(starship init bash)"

. "$CARGO_HOME/env"
