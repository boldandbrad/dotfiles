# ------------------------------------------------------------ #
# fish config                                                  #
# docs: https://fishshell.com/docs/current/index.html          #
# ------------------------------------------------------------ #

aliae init fish --config $DOTFILES/config/aliae/aliae.yaml | source

if status is-interactive
  zoxide init --cmd cd fish | source
  starship init fish | source
end
