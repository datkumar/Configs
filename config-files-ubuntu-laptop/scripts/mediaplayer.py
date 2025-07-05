#!/usr/bin/env python3

import subprocess
import json

def get_players():
    try:
        return subprocess.check_output(["playerctl", "-l"]).decode().splitlines()
    except subprocess.CalledProcessError:
        return []

def get_status(player):
    try:
        return subprocess.check_output(["playerctl", "-p", player, "status"]).decode().strip()
    except subprocess.CalledProcessError:
        return None

def get_metadata(player):
    try:
        artist = subprocess.check_output(["playerctl", "-p", player, "metadata", "artist"]).decode().strip()
    except subprocess.CalledProcessError:
        artist = "Unknown Artist"

    try:
        title = subprocess.check_output(["playerctl", "-p", player, "metadata", "title"]).decode().strip()
    except subprocess.CalledProcessError:
        title = "Unknown Title"

    return artist, title


# NOTE:  I turned off toolstip in config so ignore that content

def main():
    players = get_players()
    
    if not players:
        print("")  # Hide block
        return

    active_player = None
    status = None

    for p in players:
        s = get_status(p)
        if s == "Playing":
            active_player = p
            status = s
            break

    if not active_player:
        for p in players:
            s = get_status(p)
            if s == "Paused":
                active_player = p
                status = s
                break
    
    if not active_player or not status:
        print("")  # Nothing to show
        return


    artist, title = get_metadata(active_player)
    
    if not artist or not title:
        print("")  # Metadata not available; hide
        return

    icon = {"Playing": "", "Paused": ""}.get(status, "")
    display_text = f"{icon} {title} - {artist}"
    truncated = display_text[:50] + ("…" if len(display_text) > 50 else "")
    tooltip = f"{title} - {artist}\nStatus: {status}\nPlayer: {active_player}"

    print(json.dumps({
        "text": truncated,
        "tooltip": tooltip,
        "class": status.lower(),
        "alt": status
    }))

if __name__ == "__main__":
    main()
