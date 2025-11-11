#!/bin/sh

# initialize
sketchybar --add item volume right

# config
sketchybar --set volume script="$PLUGIN_DIR/volume.sh"
sketchybar --subscribe volume volume_change

