#!/usr/bin/env bash

################################################################
# tools/vscodium/install_extensions.sh - install extensions    #
################################################################
# Install vscodium extensions specified in                     #
# config/vscodium/extensions.txt.                              #
################################################################

echo -e "\nInstalling VSCodium extensions...\n"

# build single command to prevent unnecessary print outs and overhead
cmd=codium
while read -r line; do
    cmd="${cmd} --install-extension ${line}"
done < $DOTFILES/config/vscodium/extensions.txt

# install extensions
eval $cmd
echo -e "\nVSCodium extensions have been installed!"
