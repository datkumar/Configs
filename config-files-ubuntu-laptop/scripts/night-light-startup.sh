#!/usr/bin/env bash

STATUS_FILE="/tmp/nightlight.status"
SIGNAL_NUM=5

# Time in minutes since midnight
NOW=$(date +%H:%M)
HOUR=${NOW%%:*}
MIN=${NOW##*:}
NOW_MIN=$((10#$HOUR * 60 + 10#$MIN))

# 23:30 = 1410, 06:30 = 390
if [[ $NOW_MIN -ge 1410 || $NOW_MIN -lt 390 ]]; then
    if [[ -f "$STATUS_FILE" && $(cat "$STATUS_FILE") == "off" ]]; then
        # User manually disabled it, respect that
        pkill -RTMIN+5 waybar
        exit 0
    fi
    wlsunset -t 3000 -T 6500 -d 1 -S 23:30 -s 06:30 &
    echo "on" > "$STATUS_FILE"
else
    echo "off" > "$STATUS_FILE"
fi

# Send signal to update Waybar
pkill -RTMIN+$SIGNAL_NUM waybar