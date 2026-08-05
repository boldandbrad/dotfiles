# ------------------------------------------------------------ #
# zsh config - zsh plugins, zstyles, keybinds, and options     #
# docs: https://zsh.sourceforge.io/Doc/Release/zsh_toc.html    #
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
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# zstyles ---------------------------------------------------- #

# disable completion menu selection in favor of fzf
zstyle ':completion:*' menu no

# enable fzf tab completions without explicit trigger
export FZF_COMPLETION_TRIGGER=''

# initialize zsh completions
autoload -Uz compinit && compinit

# set options ------------------------------------------------ #

# history
HISTFILE="${XDG_CACHE_HOME}/.zsh_history"
SAVEHIST=4096 # number of history entries to save to history file
HISTSIZE=4096 # number of history entries loaded in memory

setopt HIST_IGNORE_DUPS # ignore contiguous history duplicates
setopt SHARE_HISTORY # share history across terminals

# other
setopt no_case_glob # enable case-insensitive tab completion and globbing

# initialize tools ------------------------------------------- #

source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# cleanup ---------------------------------------------------- #

# remove duplicates from path arrays
typeset -gU PATH FPATH
