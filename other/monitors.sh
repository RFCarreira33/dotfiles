#!/bin/sh
# Toggle second monitor on or off

output=$( xrandr --listmonitors | grep 'Monitors' )

if [[ $output == "Monitors: 1" ]]; then
	xrandr --output HDMI-1 --mode 1920x1080 --left-of HDMI-0
else
	xrandr --output HDMI-1 --off
fi

