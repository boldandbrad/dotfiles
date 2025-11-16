#!/bin/sh

# initialize
sketchybar --add item spotify e

# config
SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
sketchybar --add event spotify_change $SPOTIFY_EVENT
sketchybar --set spotify label.max_chars=40
sketchybar --set spotify scroll_texts=on
sketchybar --set spotify icon.drawing=off
sketchybar --set spotify script="$PLUGIN_DIR/spotify.sh"
sketchybar --subscribe spotify spotify_change
sketchybar --set spotify click_script="open -a Spotify"

# overrides
sketchybar --set spotify background.color=0x40cdd6f4
sketchybar --set spotify label.padding_left=8
sketchybar --set spotify label.padding_right=8
