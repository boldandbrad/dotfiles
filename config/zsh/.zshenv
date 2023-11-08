################################################################
# .zshrc - core environment variables                          #
################################################################
# -> dotbot symlinks this file to ~/.zshenv                    #
#                                                              #
# Executed when a new ZSH session is launched.                 #
# Set XDG paths and other core environment variables.          #
################################################################

# set default apps
export BROWSER="safari"
export EDITOR="codium"
export PAGER="less"
# export TERMINAL="hyper"

# set XDG paths
export XDG_BIN_HOME=~/.local/bin
export XDG_CACHE_HOME=~/.local/var/cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_LIB_HOME=~/.local/lib
export XDG_STATE_HOME=~/.local/state

# respect XDG paths
# export CARGO_HOME="${XDG_DATA_HOME}/cargo"
# export CURL_HOME="${XDG_CONFIG_HOME}/curl"
# export GIT_CONFIG="${XDG_CONFIG_HOME}/git/.gitconfig"
export LESSHISTFILE="-" # disable less history
# export PIP_CONFIG_FILE="${XDG_CONFIG_HOME}/pip/pip.conf"
# export PIP_LOG_FILE="${XDG_DATA_HOME}/pip/log"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

export HOMEBREW_BUNDLE_FILE=~/.config/homebrew/Brewfile
# export PKGX_DIR=~/.cache/pkgx
# export PNPM_HOME=~/Library/pnpm
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# other variables
export DOTFILES=~/Setup/dotfiles

# add local sbin to path
export PATH="/usr/local/sbin:$PATH"
