#!/bin/bash
if hyprctl clients | grep -q "class: discord"; then
    hyprctl dispatch focusmonitor "DP-1"
    hyprctl dispatch togglespecialworkspace Discord
else
    discord &
    sleep 0.5
    hyprctl dispatch togglespecialworkspace Discord
fi
