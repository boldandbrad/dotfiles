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

set -gx GOPATH $XDG_DATA_HOME/go

set -gx DOTFILES ~/Dotfiles
set -gx HOMEBREW_BUNDLE_FILE $DOTFILES/backup/mac/Brewfile
set -gx FZF_DEFAULT_OPTS_FILE $DOTFILES/config/fzf/.fzfrc

fish_add_path $DOTFILES/bin
fish_add_path $GOPATH/bin
fish_add_path /opt/homebrew/bin

if status is-interactive
  fish_config theme choose catppuccin-mocha
  set -g fish_key_bindings fish_vi_key_bindings
  set -g fish_cursor_default block
  set -g fish_cursor_insert block

  if type -q brew
    brew shellenv fish | source
  end
  if type -q fzf
    fzf --fish | source
  end
  if type -q zoxide
    zoxide init --cmd cd fish | source
  end
  if type -q starship
    starship init fish | source
  end

  if type -q eza
    alias ls="eza --classify=always"
  end
  alias grep="grep --color=auto"
  alias ppath 'printf "%s\n" $PATH'
  alias oil="nvim --cmd 'let g:auto_session_enabled = v:false' -c ':Oil'"

  abbr -a mkdir "mkdir -pv"
  abbr -a mv "mv -iv"
  abbr -a cp "cp -Riv"
  abbr -a untrack "git rm --cached"
  abbr -a ffp "ffprobe -v quiet -output_format json -show_format"

  if test (uname) = Darwin
    abbr -a netspeed "NetworkQuality"
    abbr -a ql "qlmanage -p"
    abbr -c cd -c ls -c cp -c mv icloud ~"/Library/Mobile\ Documents/com~apple~CloudDocs"
  end
end
