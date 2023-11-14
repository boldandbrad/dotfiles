################################################################
# general.zsh - vscodium aliases                               #
################################################################
# -> dotbot symlinks this file into ~/.config/zsh/aliases/     #
#                                                              #
# Sourced from .zshrc                                          #
# Setup vscodium zsh aliases.                                  #
################################################################

# codium extension export
alias codexp="codium --list-extensions > $DOTFILES/config/vscodium/extensions.txt && echo '\tExported VSCodium extensions list to DOTFILES.'"

# codium extension install
alias codein="$DOTFILES/scripts/tools/vscodium/install_extensions.sh"
