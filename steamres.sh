#!/bin/bash

# the actual options 
CHOICE=$(printf "4k HDR\n4k\n1440p HDR\n1440p Widescreen\n1440p\n1080p\n720p" | rofi -dmenu -p "Choose resolution:")

# maps choices to stuff
case "$CHOICE" in
  "4k HDR")
    TEXT="MANGOHUD=1 gamescope -w 3840 -W 3840 -h 2160 -H 2160 --force-grab-cursor --hdr-enabled --hdr-sdr-content-nits 1300 --hdr-debug-force-output -- %command%"
    ;;
  "4k")
    TEXT="MANGOHUD=1 gamescope -w 3840 -W 3840 -h 2160 -H 2160 --force-grab-cursor -- %command%"
    ;;
  "1440p HDR")
    TEXT="MANGOHUD=1 gamescope -w 2560 -W 2560 -h 1440 -H 1440 --force-grab-cursor --hdr-enabled --hdr-sdr-content-nits 1300 --hdr-debug-force-output -- %command%"
    ;;
  "1440p Widescreen")
    TEXT="MANGOHUD=1 gamescope -w 3440 -W 3440 -h 1440 -H 1440 --force-grab-cursor -- %command%"
    ;;
  "1440p")
    TEXT="MANGOHUD=1 gamescope -w 2560 -W 2560 -h 1440 -H 1440 --force-grab-cursor -- %command%"
    ;;
  "1080p")
    TEXT="MANGOHUD=1 gamescope -w 1920 -W 1920 -h 1080 -H 1080 --force-grab-cursor -- %command%"
    ;;
  "720p")
    TEXT="MANGOHUD=1 gamescope -w 1280 -W 1280 -h 720 -H 720 --force-grab-cursor -- %command%"
    ;;
  *)
    exit 1  #close if they do something wrong or close it
    ;;
esac

# copies the actual thing
echo -n "$TEXT" | wl-copy 


