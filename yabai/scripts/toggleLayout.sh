#!/bin/bash

current_layout=$(yabai -m query --spaces --space | jq -r '.type')

if [ "$current_layout" == "bsp" ]; then
    yabai -m query --windows --space | jq '.[].id' | xargs -I{} yabai -m window {} --toggle zoom-fullscreen
    yabai -m space --layout float
else
    yabai -m space --layout bsp
fi
