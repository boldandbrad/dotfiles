#!/bin/sh

# event
sketchybar --add event aerospace_workspace_change

# initialize and config
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0x40cdd6f4 \
        background.drawing=off \
        icon="$sid" \
        icon.padding_left=8 \
        icon.padding_right=8 \
        label.drawing=off \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
