#!/bin/bash
if hyprctl clients | grep -q "class: steam"; then
    hyprctl dispatch focusmonitor "DP-1"
    hyprctl dispatch togglespecialworkspace Steam
else
    steam &
    sleep 0.5
    hyprctl dispatch togglespecialworkspace Steam
fi
