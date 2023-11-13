#!/usr/bin/env bash

################################################################
# alpine/update_system.sh - update alpine linux software       #
################################################################
# Install available alpine system updates.                     #
#                                                              #
# Note: System updates may force a restart. Simply rerun       #
# ./install.sh to continue.                                    #
################################################################

# check for available updates
apk update

# apply available updates
apk upgrade --available
