# disable macos ~/.zsh_sessions directory
# for why this export needs to exist in .zprofile, see https://superuser.com/questions/1610587/disable-zsh-session-folder-completely
export SHELL_SESSIONS_DISABLE=1

# add obsidian-cli to path
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
fi
