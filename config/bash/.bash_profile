test -f ~/.bashrc && . ~/.bashrc

. "$HOME/.cargo/env"

eval "$(pkgx --shellcode)"  #docs.pkgx.sh/shellcode
