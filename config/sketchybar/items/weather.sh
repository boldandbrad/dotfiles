#!/bin/sh

#initialize
sketchybar --add item weather right

# config
sketchybar --set weather update_freq=120
sketchybar --set weather icon.drawing=off
sketchybar --set weather script="$PLUGIN_DIR/weather.sh"

