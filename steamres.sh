#!/bin/bash

# Check for rofi or dmenu
if command -v dmenu &> /dev/null; then
    MENU="dmenu -p"
elif command -v rofi &> /dev/null; then
    MENU="rofi -dmenu -p"
else
    echo "Neither rofi nor dmenu is installed." >&2
    notify-send "Neither rofi nor dmenu is installed." >&2
    exit 1
fi

CHOICE=$(printf "4k HDR\n4k Ultrawide\n4k\n1440p HDR\n1440p Ultrawide\n1440p\n1080p Ultrawide\n1080p\n720p\n8k (Not Recommended/unstable)" | $MENU "Choose resolution:")

KEY_DELAY="0"
KEY_HOLD="0"

HDR_NITS="1300"

case "$CHOICE" in
  "4k HDR")
    TEXT="MANGOHUD=1 gamescope -w 3840 -W 3840 -h 2160 -H 2160 --force-grab-cursor --hdr-enabled --hdr-sdr-content-nits $HDR_NITS --hdr-debug-force-output -- %command%"
    ;;
  "4k Widescreen")
    TEXT="MANGOHUD=1 gamescope -w 5160 -W 5160 -h 2160 -H 2160 --force-grab-cursor --force-grab-cursor -- %command%"
    ;;
  "4k")
    TEXT="MANGOHUD=1 gamescope -w 3840 -W 3840 -h 2160 -H 2160 --force-grab-cursor -- %command%"
    ;;
  "1440p HDR")
    TEXT="MANGOHUD=1 gamescope -w 2560 -W 2560 -h 1440 -H 1440 --force-grab-cursor --hdr-enabled --hdr-sdr-content-nits $HDR_NITS --hdr-debug-force-output -- %command%"
    ;;
  "1440p Widescreen")
    TEXT="MANGOHUD=1 gamescope -w 3440 -W 3440 -h 1440 -H 1440 --force-grab-cursor -- %command%"
    ;;
  "1440p")
    TEXT="MANGOHUD=1 gamescope -w 2560 -W 2560 -h 1440 -H 1440 --force-grab-cursor -- %command%"
    ;;
  "1080p Widescreen")
    TEXT="MANGOHUD=1 gamescope -w 2560 -W 2560 -h 1080 -H 1080 --force-grab-cursor -- %command%"
    ;;
  "1080p")
    TEXT="MANGOHUD=1 gamescope -w 1920 -W 1920 -h 1080 -H 1080 --force-grab-cursor -- %command%"
    ;;
  "720p")
    TEXT="MANGOHUD=1 gamescope -w 1280 -W 1280 -h 720 -H 720 --force-grab-cursor -- %command%"
    ;;
  "8k (Not Recommended)")
    TEXT="MANGOHUD=1 gamescope -w 7680 -W 7680 -h 4320 -H 4320 --force-grab-cursor -- %command%"
    ;;
  *)
    exit 1
    ;;
esac

ydotool key 29:1 30:1 30:0 29:0 && ydotool type --key-delay="$KEY_DELAY" --key-hold="$KEY_HOLD" "$TEXT"
