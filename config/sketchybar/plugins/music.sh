#!/bin/sh

STATE="$(rmpc status | jq '.state' | tr -d '"')"

if [ "$STATE" = "Stop" ]; then
  sketchybar --set $NAME drawing=off
else
  sketchybar --set $NAME drawing=on
fi

ARTIST="$(rmpc song | jq '.metadata.artist' | tr -d '"')"
SONG="$(rmpc song | jq '.metadata.title' | tr -d '"')"

sketchybar --set "$NAME" label="${ARTIST} - ${SONG}"

