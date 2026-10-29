#!/usr/bin/env bash

options="Lock & Screen Off
Suspend & Lock
Shutdown
Reboot"

selection=$(echo "$options" | rofi -i -show -dmenu)

if [[ "$selection" == "Lock & Screen Off" ]]; then
	doas tlp power-saver
	hyprlock &
	locker=$!
	swayidle \
		timeout 300 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' &
	idler=$!
	sleep 0.2
	kill -USR1 "$idler"
	wait "$locker"
	kill "$idler" 2>/dev/null
	swaymsg "output * dpms on"
	wlr-randr --output HDMI-A-1 --pos 0,0 --mode 1920x1080@119.878998Hz --output eDP-1 --right-of HDMI-A-1
	doas tlp start
elif [[ "$selection" == "Suspend & Lock" ]]; then
	hyprlock &
	systemctl suspend
	wlr-randr --output HDMI-A-1 --pos 0,0 --mode 1920x1080@119.878998Hz --output eDP-1 --right-of HDMI-A-1
elif [[ "$selection" == "Shutdown" ]]; then
	systemctl poweroff
elif [[ "$selection" == "Reboot" ]]; then
	systemctl reboot
fi
