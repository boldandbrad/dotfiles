#!/bin/sh

TEMP="$(curl -s wttr.in/?format='%t')"

sketchybar --set "$NAME" label="${TEMP}"
