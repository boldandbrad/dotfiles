# load aliases
if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
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
