#!/bin/sh

# initialize
sketchybar --add item clock right

# config
sketchybar --set clock update_freq=10
sketchybar --set clock icon.drawing=off
sketchybar --set clock script="$PLUGIN_DIR/clock.sh"

