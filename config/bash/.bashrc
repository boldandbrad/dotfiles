# load aliases
# if [ -f ~/.aliases ]; then
# 	source ~/.aliases
# fi

[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(pkgx --shellcode)"  #docs.pkgx.sh/shellcode