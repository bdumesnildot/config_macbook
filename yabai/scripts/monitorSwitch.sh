#!/bin/bash

debug_log_file_path="/Users/bdumesnildot/.config/yabai/scripts/debug/monitorSwitch.log"
echo "" > "$debug_log_file_path"
echo "windowSwitch - $(date)" >> "$debug_log_file_path"

cur_window=$(yabai -m query --windows --window)
echo "cur_window $cur_window" >> "$debug_log_file_path"

cur_space=$(yabai -m query --spaces --space)
echo "cur_space: $cur_space" >> "$debug_log_file_path"

cur_window=$(yabai -m query --windows --window | jq '.id')
echo "cur_window: $cur_window" >> "$debug_log_file_path"

# Move the window to the previous or next display
yabai -m window --display prev || yabai -m window --display next

# Focus the moved window
yabai -m window --focus "${cur_window}"

current_layout=$(yabai -m query --spaces --space | jq '.type')
echo "current_layout: $current_layout" >> "$debug_log_file_path"

# If the current layout is not bsp, switch to bsp
if [ "$current_layout" != "\"bsp\"" ]; then
  yabai -m config layout bsp
fi

# Swap the moved window with the last focused window
yabai -m window --swap last