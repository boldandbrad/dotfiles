# ------------------------------------------------------------ #
# zsh env and path setup                                       #
# ------------------------------------------------------------ #

export XDG_BIN_HOME=~/.local/bin
export XDG_CACHE_HOME=~/.local/var/cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_LIB_HOME=~/.local/lib
export XDG_STATE_HOME=~/.local/state

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export GOPATH=$XDG_DATA_HOME/go

export DOTFILES=$HOME/Dotfiles

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"
