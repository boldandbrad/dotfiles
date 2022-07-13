#!/bin/zsh

echo
echo "Installing VSCodium extensions..."
echo

while read -r line; do
    codium --install-extension $line
done < $DOTFILES/vscodium/extensions.txt

echo
echo "VSCodium extensions have been installed!"
