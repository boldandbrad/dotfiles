#!/usr/bin/env bash

################################################################
# arch/update_system.sh - update arch linux software           #
################################################################
# Install available arch linux system updates.                 #
#                                                              #
# Note: System updates may force a restart. Simply rerun       #
# ./install.sh to continue.                                    #
################################################################

# install available updates
sudo pacman -Syu
