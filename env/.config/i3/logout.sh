#!/usr/bin/env bash

pkill xautolock

(
	while xset q | grep -q "Monitor is Off"; do
		sleep 30
	done

	xautolock -time 5 -locker "i3lock -c 191724" &

	sudo tlp power-saver
) &

options="Lock & Screen Off
Lock & Suspend
Shutdown
Reboot"

selection=$(echo "$options" | rofi -i -show -dmenu)

if [[ "$selection" == "Lock & Screen Off" ]]; then
	sudo tlp power-saver
	i3lock -c 191724
	xset dpms force off
elif [[ "$selection" == "Lock & Suspend" ]]; then
	i3lock -c 191724
	sleep 1
	systemctl suspend
elif [[ "$selection" == "Shutdown" ]]; then
	systemctl poweroff
elif [[ "$selection" == "Reboot" ]]; then
	systemctl reboot
fi
