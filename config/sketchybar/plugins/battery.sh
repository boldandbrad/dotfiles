#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="[^]"
  ;;
  [2-8][0-9]) ICON="[]"
  ;;
  *) ICON="[!]"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="[+]"
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
