#!/usr/bin/env bash

STATUS_FILE="/tmp/nightlight.status"
ICON_ON="󰛨"
ICON_OFF=""

if [[ -f "$STATUS_FILE" && $(<"$STATUS_FILE") == "on" ]]; then
    echo "{\"text\": \"$ICON_ON\", \"tooltip\": \"Night Light is ON\", \"class\": \"nightlight-on\"}"
else
    echo "{\"text\": \"$ICON_OFF\", \"tooltip\": \"Night Light is OFF\", \"class\": \"nightlight-off\"}"
fi
