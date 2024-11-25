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

# change to root of current git repo
alias cdr='cd `git rev-parse --show-toplevel`'

################################################################
# tool replacements                                            #
################################################################

if command_exists codium ; then; alias code="codium"; fi
if command_exists eza ; then
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

  alias pkgs="brew leaves"
  alias apps="brew list --cask"
  # alias deps="brew deps --formula --for-each $(brew leaves)"
fi
