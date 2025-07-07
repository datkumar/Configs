#!/usr/bin/env python3

import subprocess
import sys
import json

VCP = "10"

def detect_monitor():
    try:
        result = subprocess.check_output(["ddcutil", "detect"], text=True)
        for line in result.splitlines():
            if "Display" in line:
                return line.split(": ")[1].strip()
    except Exception:
        pass
    return "1"  # default fallback

def get_brightness(display):
    try:
        output = subprocess.check_output(
            ["ddcutil", "getvcp", VCP, "--display", display],
            stderr=subprocess.DEVNULL,
            text=True
        )
        for line in output.splitlines():
            if "current value" in line:
                return int(line.split("=")[1].split(",")[0].strip())
    except Exception:
        pass
    return None

def set_brightness(display, value):
    try:
        subprocess.run(
            ["ddcutil", "setvcp", VCP, str(value), "--display", display],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
    except Exception:
        pass

def clamp(val):
    return max(0, min(100, val))

def main():
    display = detect_monitor()

    if len(sys.argv) == 1:
        brightness = get_brightness(display)
        if brightness is None:
            sys.exit(1)
        print(json.dumps({
            "text": str(brightness),
            "tooltip": f"Brightness: {brightness}%",
            "percentage": brightness
        }))
    else:
        arg = sys.argv[1]
        if arg.startswith(("+", "-")):
            current = get_brightness(display)
            if current is None:
                sys.exit(1)
            new_val = clamp(current + int(arg))
            set_brightness(display, new_val)
        elif arg == "set" and len(sys.argv) == 3:
            set_brightness(display, clamp(int(sys.argv[2])))
        else:
            print("Usage: monitor-brightness.py [+5|-10|set 40]")
            sys.exit(1)

if __name__ == "__main__":
    main()
