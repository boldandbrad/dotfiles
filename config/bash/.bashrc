# load aliases
# if [ -f ~/.aliases ]; then
# 	source ~/.aliases
# fi

eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(pkgx --shellcode)"  #docs.pkgx.sh/shellcode

export SHELL_SESSION_HISTORY=0

. "$CARGO_HOME/env"
