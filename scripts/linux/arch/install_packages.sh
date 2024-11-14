#!/usr/bin/env bash

################################################################
# arch/install_packages.sh - install pacman packages and apps  #
################################################################
# Install arch linux packages and apps via pacman.             #
#                                                              #
# NOTE: Does not install desktop apps, those are installed via #
# flatpak.                                                     #
################################################################

echo "Arch Linux installation coming soon..."

# install packages with pacman
pacman -S autojump
pacman -S bash
pacman -S bat
pacman -S dust
pacman -S eza
pacman -S git
pacman -S glow
pacman -S pastel
pacman -S yank
pacman -S zsh
pacman -S zsh-autosuggestions
pacman -S zsh-syntax-highlighting

pacman -S deno
pacman -S github-cli
pacman -S httpie
pacman -S podman
pacman -S rustup
pacman -S vagrant
