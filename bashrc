# load aliases
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

# make git bash prompt on windows feel more like zsh spaceship on mac, this same change may not work on macos itself.
export PS1='\[\e]0;$PWD\007\]\n\[\e[94m\]\w\[\e[93m\]`__git_ps1 2>/dev/null`\n\[\e[92m\]> \[\e[0m\]'