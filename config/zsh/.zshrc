# ------------------------------------------------------------ #
# .zshrc - zsh plugins, zstyles, keybinds, and options         #
# ------------------------------------------------------------ #
# -> symlinked to ~/.config/zsh/.zshrc                         #
# ------------------------------------------------------------ #

# if not running interactively, do nothing
[[ $- != *i* ]] && return

# install plugins -------------------------------------------- #

# initialize zinit zsh plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# install/initialize zsh plugins
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# zstyles ---------------------------------------------------- #

# disable completion menu selection in favor of fzf-tab
zstyle ':completion:*' menu no

# allow partial tab completions: cd /u/lo/b⇥ -> /usr/local/bin
zstyle ':completion:*' list-suffixes zstyle ':completion:*'

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

zstyle ':fzf-tab:*' use-fzf-default-opts yes

# color tab completed paths
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# initialize zsh completions
autoload -Uz compinit && compinit

# keybinds --------------------------------------------------- #

# zsh line editor keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# set options ------------------------------------------------ #

# configure history file
HISTFILE="${XDG_CACHE_HOME}/zsh/.zsh_history"
SAVEHIST=4096 # number of history entries to save to history file
HISTSIZE=4096 # number of history entries loaded in memory

# history
setopt APPEND_HISTORY # append to history file without overwriting
setopt HIST_IGNORE_DUPS # ignore contiguous history duplicates
setopt SHARE_HISTORY # share history across terminals

# other
setopt no_case_glob # enable case-insensitive tab completion and globbing

# initialize tools ------------------------------------------- #

# initialize ruby version manager
if (( $+commands[rbenv] )); then
eval "$(rbenv init - --no-rehash zsh)"
fi

# initialize zoxide directory hopper
if (( $+commands[zoxide] )); then
  eval "$(zoxide init --cmd cd zsh)"
fi

# initialize shell prompt
if (( $+commands[oh-my-posh] )); then
  eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME}/oh-my-posh/config.toml)"
fi

# cleanup ---------------------------------------------------- #

# remove duplicates from path arrays
typeset -gU PATH FPATH
