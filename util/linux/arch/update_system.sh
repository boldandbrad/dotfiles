#!/usr/bin/env bash

################################################################
# arch/update_system.sh - update arch linux software           #
################################################################
# Install available arch linux system updates.                 #
#                                                              #
# NOTE: System updates may force a restart. Simply rerun       #
# ./unpack.sh to continue.                                     #
################################################################

# install available updates
sudo pacman -Syu
