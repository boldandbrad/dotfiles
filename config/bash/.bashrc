export XDG_BIN_HOME=~/.local/bin
export XDG_CACHE_HOME=~/.local/var/cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_LIB_HOME=~/.local/lib
export XDG_STATE_HOME=~/.local/state

export DOTFILES=~/Dotfiles
export HOMEBREW_BUNDLE_FILE="${DOTFILES}"/backup/mac/Brewfile

export HISTFILE="${XDG_STATE_HOME}"/bash/history
export SHELL_SESSION_HISTORY=0

# initialize shell prompt
eval "$(starship init bash)"
