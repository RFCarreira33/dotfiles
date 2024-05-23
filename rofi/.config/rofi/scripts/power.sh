#!/usr/bin/env bash

choices=$(printf "󰡵 Turbo\n󱊡 Power Save\n Reboot\n󰐥 Shutdown" | rofi -dmenu -i -p "Power")
# remove icon from choice and trim
choices=$(echo "$choices" | sed 's/[^ ]* //g' | xargs)

case "$choices" in
  "Turbo") 
    sudo -A tlp ac
    notify-send "*Eurobit kicks in*"
    ;;
  "Save") 
    sudo -A tlp bat
    notify-send "Running on low power mode"
    ;;
  "Shutdown") 
    shutdown now
    ;;
  "Reboot") 
    reboot
    ;;
  *)
    echo "$choices is not a valid option."
    exit 1
    ;;
esac
