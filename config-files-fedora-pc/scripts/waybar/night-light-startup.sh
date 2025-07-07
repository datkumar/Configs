#!/usr/bin/env bash

STATUS_FILE="/tmp/nightlight.status"
SIGNAL_NUM=5

# Get current minutes since midnight
HOUR=$(date +%H)
MIN=$(date +%M)
NOW_MIN=$((10#$HOUR * 60 + 10#$MIN))

# 23:30–06:30 window
if ((NOW_MIN >= 1410 || NOW_MIN < 390)); then
    [[ -f "$STATUS_FILE" && $(<"$STATUS_FILE") == "off" ]] && pkill -RTMIN+$SIGNAL_NUM waybar && exit 0
    wlsunset -t 3000 -T 6500 -d 1 -S 23:30 -s 06:30 &
    echo "on" >"$STATUS_FILE"
else
    echo "off" >"$STATUS_FILE"
fi

pkill -RTMIN+$SIGNAL_NUM waybar
