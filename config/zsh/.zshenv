################################################################
# .zshrc - core environment variables                          #
################################################################
# -> symlinked to ~/.zshenv                                    #
#                                                              #
# Executed when a new ZSH session is launched.                 #
# Set XDG paths and other core environment variables.          #
################################################################

# set default apps
export BROWSER="safari"
export EDITOR="nvim"
export PAGER="less"

# set XDG paths
export XDG_BIN_HOME=~/.local/bin
export XDG_CACHE_HOME=~/.local/var/cache # where user-specific non-essential cached data should be written
export XDG_CONFIG_HOME=~/.config # where user-specific configurations should be written
export XDG_DATA_HOME=~/.local/share # where user-specific data files should be written
export XDG_LIB_HOME=~/.local/lib
export XDG_STATE_HOME=~/.local/state # where user-specific state files should be written

# respect XDG paths
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
# export CURL_HOME="${XDG_CONFIG_HOME}/curl"
export LESSHISTFILE="-" # disable less history
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"
export TMUX_PLUGIN_MANAGER_PATH="${XDG_DATA_HOME}/tmux/plugins"
# export VSCODE_EXTENSIONS="${XDG_DATA_HOME}/vscode
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# dotfiles
export DOTFILES=~/Setup/dotfiles
export DOTBOT_DIR="$DOTFILES/vendor/dotbot"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/scripts/macos/brew/Brewfile"

# go
export GOPATH="$XDG_DATA_HOME"/go
# add local sbin to path
export PATH="/usr/local/sbin:$PATH"
# add user bin to path
export PATH="$HOME/.local/bin:$PATH"
# add dotbot to path
export PATH="$DOTBOT_DIR/bin:$PATH"

# disable telemetry for tools that support this flag
export DO_NOT_TRACK=1

# fzf catppuccin theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

. "$CARGO_HOME/env"
