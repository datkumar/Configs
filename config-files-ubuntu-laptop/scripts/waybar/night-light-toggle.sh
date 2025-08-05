#!/usr/bin/env bash

STATUS_FILE="/tmp/nightlight.status"
SIGNAL_NUM=5

if pgrep -x wlsunset >/dev/null; then
    killall wlsunset
    echo "off" > "$STATUS_FILE"
else
    wlsunset -t 4500 -T 6500 -d 1 -S 23:30 -s 06:30 &
    echo "on" > "$STATUS_FILE"
fi

# Send signal to update Waybar
pkill -RTMIN+$SIGNAL_NUM waybar