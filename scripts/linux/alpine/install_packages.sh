#!/usr/bin/env bash

################################################################
# alpine/install_packages.sh - install apk packages and apps   #
################################################################
# Install alpine linux packages and apps via apk.              #
#                                                              #
# NOTE: Does not install desktop apps, those are installed via #
# flatpak.                                                     #
################################################################

echo "Alpine Linux installation coming soon..."

# install packages with apk
apk add bash
apk add bat
apk add direnv
apk add dust
apk add eza
apk add git
apk add glow
apk add just
apk add starship
apk add zsh
apk add zsh-autosuggestions
apk add zsh-syntax-highlighting

apk add deno
apk add github-cli
apk add httpie
apk add podman
apk add pre-commit
apk add rustup
