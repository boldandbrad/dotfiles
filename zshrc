# load aliases
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

# initialize pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# initialize nodenv
if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# added by travis gem
[ ! -s ~/.travis/travis.sh ] || source ~/.travis/travis.sh

# Set Spaceship ZSH as the prompt
export SPACESHIP_DIR_COLOR="blue"
export SPACESHIP_GIT_BRANCH_COLOR="yellow"
export SPACESHIP_PYENV_COLOR="green"
autoload -U promptinit; promptinit
prompt spaceship

# zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# brew autocompletion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
