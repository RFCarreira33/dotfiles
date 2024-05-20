#!/usr/bin/env bash

choices=$(printf "󰡵 Turbo\n󱊡 Power Save\n󰐥 Shutdown\n Reboot" | rofi -dmenu -i -p "Power")
# remove icon from choice and trim
choices=$(echo "$choices" | sed 's/[^ ]* //g' | xargs)

case "$choices" in
  "Turbo") 
    # prompt for sudo user password using rofi
    sudo -A tlp ac
    ;;
  "Save") 
    sudo -A tlp bat
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
