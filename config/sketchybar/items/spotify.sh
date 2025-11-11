#!/bin/sh

# initialize
sketchybar --add item spotify right

# config
SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
sketchybar --add event spotify_change $SPOTIFY_EVENT
sketchybar --set spotify label.max_chars=40
sketchybar --set spotify icon.drawing=off
sketchybar --set spotify script="$PLUGIN_DIR/spotify.sh"
sketchybar --subscribe spotify spotify_change

# overrides
sketchybar --set spotify background.color=0x40cdd6f4
sketchybar --set spotify label.padding_left=8
sketchybar --set spotify label.padding_right=8
