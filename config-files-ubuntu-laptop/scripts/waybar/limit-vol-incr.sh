#!/bin/bash

MAX_VOL=100
STEP=5

# Get the current volume (first percentage found)
current_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Calculate the new volume
new_vol=$(( current_vol + STEP ))

# Clamp to MAX_VOL if needed
if [ "$new_vol" -gt "$MAX_VOL" ]; then
  new_vol=$MAX_VOL
fi

# Set the new volume
pactl set-sink-volume @DEFAULT_SINK@ ${new_vol}%
