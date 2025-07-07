#!/usr/bin/env bash

STATUS_FILE="/tmp/nightlight.status"
SIGNAL_NUM=5

# Check if wlsunset is active
if pgrep -x wlsunset >/dev/null; then
    echo "Disabling wlsunset..."
    killall wlsunset
    sleep 0.3
    echo "off" >"$STATUS_FILE"
else
    echo "Enabling wlsunset..."
    wlsunset -t 4500 -T 6500 -d 1 -S 23:30 -s 06:30 &
    echo "on" >"$STATUS_FILE"
fi

# Trigger Waybar to refresh
pkill -RTMIN+$SIGNAL_NUM waybar
