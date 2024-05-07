# load aliases
# if [ -f ~/.aliases ]; then
# 	source ~/.aliases
# fi

eval "$(direnv hook bash)"

export SHELL_SESSION_HISTORY=0

. "$CARGO_HOME/env"

# starship prompt
eval "$(starship init bash)"
