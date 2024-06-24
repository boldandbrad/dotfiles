#!/usr/bin/env bash

################################################################
# ubuntu/install_packages.sh - install apt packages and apps   #
################################################################
# Install ubuntu linux packages and apps via apt.              #
#                                                              #
# NOTE: Does not install desktop apps, those are installed via #
# flatpak.                                                     #
################################################################

echo "Ubuntu Linux installation coming soon..."

# install packages with apt
apt install autojump
apt install bat
apt install exa       # TODO: find out how to install eza instead
apt install git
apt install tailspin
apt install yank
apt install zsh

apt install gh
apt install httpie
apt install podman
apt install pre-commit
apt install vagrant

# deb-get?
