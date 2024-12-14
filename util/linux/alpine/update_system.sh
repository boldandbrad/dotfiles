#!/usr/bin/env bash
# TODO: default shell on alpine is ash, make sure this script works

################################################################
# alpine/update_system.sh - update alpine linux software       #
################################################################
# Install available alpine system updates.                     #
#                                                              #
# NOTE: System updates may force a restart. Simply rerun       #
# ./unpack.sh to continue.                                     #
################################################################

# check for available updates
apk update

# apply available updates
apk upgrade --available
