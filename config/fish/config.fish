aliae init fish --config $DOTFILES/config/aliae/aliae.yaml | source

if status is-interactive
  zoxide init --cmd cd fish | source
  oh-my-posh init fish --config $XDG_CONFIG_HOME/oh-my-posh/config.toml | source
  # starship init fish | source
end
