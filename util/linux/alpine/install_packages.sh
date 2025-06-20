#!/usr/bin/env bash
# TODO: default shell on alpine is ash, make sure this script works

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
apk add eza
apk add git
apk add zsh
apk add zsh-autosuggestions
apk add zsh-syntax-highlighting

apk add deno
apk add github-cli
apk add httpie
apk add podman
apk add rustup
