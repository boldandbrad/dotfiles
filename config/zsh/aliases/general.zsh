################################################################
# general.zsh - general aliases                                #
################################################################
# -> dotbot symlinks this file into ~/.config/zsh/aliases/     #
#                                                              #
# Sourced from .zshrc                                          #
# Setup general zsh aliases.                                   #
################################################################

SYSTEM_TYPE=$(uname -s) # system type - Linux / MacOS (Darwin)

# check if a command exists
command_exists () {
  hash "$1" 2> /dev/null
}

################################################################
# tool replacements                                            #
################################################################

if command_exists bat ; then; alias cat="bat"; fi
if command_exists codium ; then; alias code="codium"; fi
if command_exists podman ; then; alias docker="podman"; fi
if command_exists eza ; then
  alias ls="eza --classify"
  alias la="eza --all --classify" # list all
  alias ll="eza --all --long --header --classify" # list all files, with full details
  alias lt="eza --tree --classify --sort=type --ignore-glob .git" # list as tree, sort by type, ignore git dir
  alias lta="eza --all --tree --classify --sort=type --ignore-glob .git" # list all as tree, sort by type, ignore git dir
  alias ld="eza --only-dirs --classify" # list only dirs
  alias lda="eza --all --only-dirs --classify" # list all only dirs
  alias lm="eza --all --reverse --long --header --sort=modified" # list all sorted by last modified
  alias lg="eza --all --git --long --tree --sort=type --no-permissions --no-filesize --no-user --no-time --git-ignore --ignore-glob .git" # list all as tree with git status
else
  alias la="ls -A" # list all
  alias ll='ls -lAFh' # list all files, with full details
  alias ld='ls -l | grep "^d"' # list only dirs
  alias lm='ls -tA -1' # list all sorted by last modified
fi

alias rm="trash" # prefer safer mv to trash function over rm

################################################################
# command defaults                                             #
################################################################

# mkdir, make intermediary directories and be verbose
alias mkdir="mkdir -pv"

# mv, prompt before move and be verbose
alias mv="mv -iv"

# cp, copy directory contents, prompt before copy and be verbose
alias cp="cp -Riv"

# dust, print tree upside down
if command_exists dust ; then; alias dust="dust -r"; fi

# glow, output with pager
if command_exists glow ; then; alias glow="glow -p"; fi

################################################################
# navigation                                                   #
################################################################

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
alias cg='cd `git rev-parse --show-toplevel`' # root of git repo

################################################################
# other                                                        #
################################################################

# macOS specific aliases
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  alias awake="caffeinate" # prevent system from sleeping
  alias cwd="pwd | pbcopy" # copy current working directory path
  alias finder="open ." # open pwd in Finder
  alias ql="qlmanage -p ${@} > /dev/null 2> /dev/null" # quicklook from the terminal
  alias safari="open -a Safari"

  # remove brew doctor warning (https://github.com/pyenv/pyenv#homebrew-in-macos)
  # alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi

alias dud='du -d 1 -h' # list sizes of directories within directory
alias duf='du -sh *' # list sizes of files within directory

# lock a file or directory in a password protected archive
alias lock="zip -erj"
alias unlock="unzip -d"

# dotfile refresh
alias refresh="dotbot -c $DOTFILES/symlinks.yaml"
alias reload=". ${ZDOTDIR}/.zshrc"

# gh repo clone refresh
alias clone="source $DOTFILES/scripts/tools/clone_public_repos.zsh"

# pretty print PATH
alias path='echo $PATH | tr -s ":" "\n"'
alias fpath='echo $FPATH | tr -s ":" "\n"'

# browsers
alias arc="open -a Arc"
alias firefox="open -a Firefox"

# activate python venv in the current directory
alias pysrc="source .venv/bin/activate"
