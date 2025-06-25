#!/bin/bash

BRIGHT_FILE="/tmp/brightness_level"
[ -f "$BRIGHT_FILE" ] || echo 50 > "$BRIGHT_FILE"

current=$(<"$BRIGHT_FILE")
new=$((current + 5))
[ "$new" -gt 100 ] && new=100

echo "$new" > "$BRIGHT_FILE"
ddcutil --sleep-multiplier=0 setvcp 10 "$new"
notify-send "Brightness ↑" "$new%"

