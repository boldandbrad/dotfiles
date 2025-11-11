#!/bin/sh

# initialize
sketchybar --add item battery right

# config
sketchybar --set battery update_freq=120
sketchybar --set battery script="$PLUGIN_DIR/battery.sh"
sketchybar --subscribe battery system_woke power_source_change

