#!/bin/sh

# initialize
sketchybar --add item front_app left

# config
sketchybar --set front_app icon.drawing=off
sketchybar --set front_app script="$PLUGIN_DIR/front_app.sh"
sketchybar --subscribe front_app front_app_switched

