################################################################
# .zshrc - ZSH session setup                                   #
################################################################
# -> dotbot symlinks this file to ~/.config/zsh/.zshrc         #
#                                                              #
# Executed when a new ZSH session is launched.                 #
# Import plugins, aliases, functions, and configs.             #
################################################################

# zsh config directory
zsh_dir=${${ZDOTDIR}:-$HOME/.config/zsh}

# if not running interactively, do nothing
[[ $- != *i* ]] && return

# source antidote and initialize zsh plugins
# TODO: make this line os agnostic
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
zstyle ':antidote:bundle' file $zsh_dir/.zsh_plugins
antidote load

# allow tab completion menu selection
zstyle ':completion:*' menu select

# allow partial tab completions: cd /u/lo/b⇥ -> /usr/local/bin
zstyle ':completion:*' list-suffixes zstyle ':completion:*'

# initialize zsh completions
autoload -Uz compinit
compinit

# meeple-cli completions
eval "$(_MEEPLE_COMPLETE=zsh_source meeple)"

# source zsh config files
if [[ -d $zsh_dir ]]; then
  # source aliases
  for alias_file in "$zsh_dir"/aliases/*; do
    source ${alias_file}
  done
  # source functions
  for func_file in "$zsh_dir"/lib/*; do
    source ${func_file}
  done
  # source options
  source ${zsh_dir}/.zsh_options
fi

# initialize zoxide
if (( $+commands[zoxide] )); then
  eval "$(zoxide init --cmd cd zsh)"
fi

# initialize pyenv
if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
fi

# initialize fnm
if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd)"
fi

# initialize starship
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

# remove duplicates from path arrays
typeset -gU PATH FPATH
