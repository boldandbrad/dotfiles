################################################################
# python.zsh - python aliases                                  #
################################################################
# -> dotbot symlinks this file into ~/.config/zsh/aliases/     #
#                                                              #
# Sourced from .zshrc                                          #
# Setup python zsh aliases.                                    #
################################################################

# run python quicker
alias py="python"

# delete all .pyc files
alias delpyc="find . -name '*.pyc' -delete"

# activate python venv in the current repo
# alias pysrc="source $(git rev-parse --show-toplevel)/.venv/bin/activate"
