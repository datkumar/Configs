#!/usr/bin/env bash

STATUS_FILE="/tmp/nightlight.status"

if [[ -f "$STATUS_FILE" && $(cat "$STATUS_FILE") == "on" ]]; then
    echo '{"text": "󰛨", "tooltip": "Night Light is ON", "class": "nightlight-on"}'
else
    echo '{"text": "", "tooltip": "Night Light is OFF"}'
fi
