################################################################
# general.zsh - general aliases                                #
################################################################
# -> dotbot symlinks this file into ~/.config/zsh/aliases/     #
#                                                              #
# Sourced from .zshrc                                          #
# Setup general zsh aliases.                                   #
################################################################

command_exists () {
  hash "$1" 2> /dev/null
}

# tool replacements
if command_exists bat ; then; alias cat="bat"; fi
if command_exists codium ; then; alias code="codium"; fi
if command_exists podman ; then; alias docker="podman"; fi
if command_exists eza ; then
  alias ls="eza --classify"
  alias la="eza --all --classify" # list all
  alias ll="eza --all --long --header --classify" # list all files, with full details
  alias lt="eza --tree --classify --sort=type"
  alias lta="eza --all --tree --classify --sort=type"
  alias ld="eza --only-dirs --classify" # list only dirs
  alias lda="eza --all --only-dirs --classify" # list all only dirs
  alias lm="eza --all --reverse --long --header --sort=modified" # list all sorted by last modified
else
  alias la="ls -A" # list all
  alias ll='ls -lAFh' # list all files, with full details
  alias ld='ls -l | grep "^d"' # list only dirs
  alias lm='ls -tA -1' # list all sorted by last modified
fi

alias rm="trash" # prefer safer mv to trash function over rm

# navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"
alias ap="cd ~/Applications"
alias dt="cd ~/Desktop"
alias dv="cd ~/Developer"
alias dc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias sp="cd ~/Setup"
alias dots="cd $DOTFILES"

# other replacements
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias cp="cp -Riv"
alias cwd="pwd | pbcopy"
alias reload=". ${ZDOTDIR}/.zshrc"
alias awake="caffeinate" # macos only
alias dust="dust -r"
alias finder="open ." # open pwd in Finder

alias dud='du -d 1 -h' # List sizes of directories within directory
alias duf='du -sh *' # List sizes of files within directory

# lock a file or directory in a password protected archive
alias lock="zip -erj"
alias unlock="unzip -d"

# remove brew doctor warning (https://github.com/pyenv/pyenv#homebrew-in-macos)
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# dotfile refresh
alias refresh="dotbot -c $DOTFILES/symlinks.yaml"

# gh repo clone refresh
alias clone="source $DOTFILES/gh/install.zsh"

# pretty print PATH
alias path='echo $PATH | tr -s ":" "\n"'
alias fpath='echo $FPATH | tr -s ":" "\n"'

# glow markdown viewer with pager
alias glow="glow -p"

# quicklook from the terminal
alias ql="qlmanage -p ${@} > /dev/null 2> /dev/null"

# browsers
alias safari="open -a Safari"
alias firefox="open -a Firefox"

# activate python venv in the current directory
alias pysrc="source .venv/bin/activate"
