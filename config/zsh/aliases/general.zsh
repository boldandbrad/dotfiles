################################################################
# general.zsh - general aliases                                #
################################################################
# -> symlinked into ~/.config/zsh/aliases/                     #
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
# navigation                                                   #
################################################################

alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"
alias app="cd ~/Applications"
alias dtp="cd ~/Desktop"
alias dvp="cd ~/Developer"
alias doc="cd ~/Documents"
alias dnl="cd ~/Downloads"
alias stp="cd ~/Setup"
alias dtf="cd $DOTFILES"

# change to root of current git repo
alias cdr='cd `git rev-parse --show-toplevel`'

# user config dir
alias cfg="cd ${XDG_CONFIG_HOME}"

################################################################
# tool replacements                                            #
################################################################

if command_exists nvim ; then; alias vim="nvim"; fi
if command_exists bat ; then; alias cat="bat"; fi
if command_exists codium ; then; alias code="codium"; fi
if command_exists podman ; then; alias docker="podman"; fi
if command_exists tldr ; then; alias help="tldr"; fi
if command_exists eza ; then
  # list normal
  alias ls="eza --classify"
  # list all
  alias la="eza --all --classify"
  # list all, with full details
  alias ll="eza --all --long --header --classify"
  # list normal as tree, sorted by type, ignoring .git dir
  alias lt="eza --tree --classify --sort=type --ignore-glob .git"
  # list all as tree, sorted by type, ignoring .git dir
  alias lta="eza --all --tree --classify --sort=type --ignore-glob .git"
  # list normal dirs only
  alias ld="eza --only-dirs --classify"
  # list all dirs only
  alias lda="eza --all --only-dirs --classify"
  # list all, sorted by last modified
  alias lm="eza --all --reverse --long --header --sort=modified"
  # list all as tree, with git status, ignoring .git dir
  alias lgt="eza --all --git --long --tree --sort=type --no-permissions --no-filesize --no-user --no-time --git-ignore --ignore-glob .git"
else
  # list all
  alias la="ls -A" # list all
  # list all, with full details
  alias ll="ls -lAFh"
  # list normal dirs only
  alias ld="ls -l | grep '^d'"
  # list all dirs only
  alias lda="ls -lA | grep '^d'"
  # list all sorted by last modified
  alias lm="ls -tA -1"
fi

# prefer safer mv to trash function over rm
# alias rm="trash"

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
# if command_exists glow ; then; alias glow="glow -p"; fi

################################################################
# platform specific                                            #
################################################################

# macOS specific aliases
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  # prevent system from sleeping
  alias awake="caffeinate"
  # copy current working directory path
  alias cwd="pwd | pbcopy"
  # open pwd in Finder
  alias finder="open ."
  # open file in macOS quicklook
  alias ql="qlmanage -p ${@} > /dev/null 2> /dev/null"

  # open Arc browser
  alias arc="open -a Arc"
  # open Safari browser
  alias safari="open -a Safari"

  # change to obsidian vault
  alias spc="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/space"

  # change to icloud directory
  alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

  # empty the trash on all mounted volumes and the main HDD
  # also, clear Apple’s System Logs to improve shell startup speed
  alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

  # remove brew doctor warning (https://github.com/pyenv/pyenv#homebrew-in-macos)
  # alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi

################################################################
# other niceties                                               #
################################################################

# clear screen
alias clr="clear"
alias cls="clear; ls"
alias clg="clear; git st"
alias cld="clear; cd"

# file and dir sizes
alias dud='du -d 1 -h' # list sizes of directories within directory
alias duf='du -sh *' # list sizes of files within directory

# lock a file or directory in a password protected archive
alias lock="zip -erj"
alias unlock="unzip -d"

# pretty print PATH
alias path='echo $PATH | tr -s ":" "\n"'
alias fpath='echo $FPATH | tr -s ":" "\n"'

# open browsers
alias firefox="open -a Firefox"
