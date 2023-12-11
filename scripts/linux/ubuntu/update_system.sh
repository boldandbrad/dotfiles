#!/usr/bin/env bash

################################################################
# ubuntu/update_system.sh - update ubuntu software             #
################################################################
# Install available ubuntu system updates.                     #
#                                                              #
# NOTE: System updates may force a restart. Simply rerun       #
# ./install.sh to continue.                                    #
################################################################

# check for available updates
sudo apt update

# apply available updates
sudo apt upgrade -y
