# ------------------------------------------------------------ #
# zsh config - zsh plugins, zstyles, keybinds, and options     #
# docs: https://zsh.sourceforge.io/Doc/Release/zsh_toc.html    #
# ------------------------------------------------------------ #

# if not running interactively, do nothing
[[ $- != *i* ]] && return

# env variables ---------------------------------------------- #

export DO_NOT_TRACK=1
export EDITOR="nvim"
export PAGER="less"

export HOMEBREW_BUNDLE_PATH=$DOTFILES/backup/mac/Brewfile

export ZVM_CURSOR_STYLE_ENABLED=false

# zstyles ---------------------------------------------------- #

# disable completion menu selection in favor of fzf
zstyle ':completion:*' menu no

# enable fzf tab completions without explicit trigger
export FZF_COMPLETION_TRIGGER=''
export FZF_DEFAULT_OPTS_FILE=$DOTFILES/config/fzf/.fzfrc

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

# aliases ---------------------------------------------------- #

alias ls='eza --classify=always'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias cp='cp -Riv'
alias grep='grep --color=auto'
alias ppath='echo $PATH | tr ":" "\n"'
alias oil='nvim --cmd "let g:auto_session_enabled = v:false" -c ":Oil"'
alias ffp='ffprobe -v quiet -output_format json -show_format'

# initialize tools ------------------------------------------- #

source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# cleanup ---------------------------------------------------- #

# remove duplicates from path arrays
typeset -gU PATH FPATH
