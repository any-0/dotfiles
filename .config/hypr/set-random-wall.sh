#!/usr/bin/env bash

WALLDIR="$HOME/Pictures/Wallpapers"

# pick a random image
IMG=$(find "$WALLDIR" -type f | shuf -n1)
echo "DEBUG: selected = $IMG" >&2
[ -z "$IMG" ] && { echo "ERROR: no images in $WALLDIR" >&2; exit 1; }

# make sure hyprpaper daemon is running
if ! pgrep -x hyprpaper >/dev/null; then
  echo "DEBUG: starting hyprpaper…" >&2
  hyprpaper &
  sleep 0.5
fi

# detect the first monitor (no jq needed)
MON=$(hyprctl monitors | awk '/Name:/{print $2; exit}')
echo "DEBUG: monitor = $MON" >&2

# swap in the new wallpaper without preload
hyprctl hyprpaper reload "${MON},${IMG}"
