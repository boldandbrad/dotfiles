#!/bin/sh

#initialize
sketchybar --add item music e

# config
sketchybar --set music update_freq=10
sketchybar --set music icon.drawing=off
sketchybar --set music background.color=0x40cdd6f4
sketchybar --set music label.max_chars=32
sketchybar --set music scroll_texts=on
sketchybar --set music label.scroll_duration=256
sketchybar --set music click_script="rmpc togglepause"
sketchybar --set music script="$PLUGIN_DIR/music.sh"

