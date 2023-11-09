#!/bin/zsh

echo
echo "Installing VSCodium extensions..."
echo

cmd=codium

# build single command to prevent unnecessary print outs and overhead
while read -r line; do
    cmd="${cmd} --install-extension ${line}"
done < $DOTFILES/vscodium/extensions.txt

eval $cmd

echo
echo "VSCodium extensions have been installed!"
