# ------------------------------------------------------------ #
# fish config                                                  #
# docs: https://fishshell.com/docs/current/index.html          #
# ------------------------------------------------------------ #

set -g fish_greeting
set -gx DO_NOT_TRACK 1
set -gx EDITOR nvim
set -gx PAGER less

set -gx XDG_BIN_HOME ~/.local/bin
set -gx XDG_CACHE_HOME ~/.local/var/cache
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME ~/.local/share
set -gx XDG_LIB_HOME ~/.local/lib
set -gx XDG_STATE_HOME ~/.local/state

set -gx DOTFILES ~/Dotfiles

if test (uname) = Darwin
  set -gx HOMEBREW_BUNDLE_FILE $DOTFILES/backup/mac/Brewfile
end

if status is-interactive
  brew shellenv fish | source
  fzf --fish | source
  zoxide init --cmd cd fish | source
  starship init fish | source

  set -gx FZF_DEFAULT_OPTS_FILE $DOTFILES/config/fzf/.fzfrc

  alias ls="eza --classify=always"
  alias grep="grep --color=auto"
  alias oil="nvim --cmd 'let g:auto_session_enabled = v:false' -c ':Oil'"

  abbr -a mkdir "mkdir -pv"
  abbr -a mv "mv -iv"
  abbr -a cp "cp -Riv"
  abbr -a ffp "ffprobe -v quiet -output_format json -show_format"

  if test (uname) = Darwin
    abbr -a ql "qlmanage -p"
    abbr -c cd -c ls icloud ~"/Library/Mobile\ Documents/com~apple~CloudDocs"
  end
end
