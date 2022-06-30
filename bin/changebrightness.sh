#!/bin/bash

function send_notification() {
	bright=$(brightnessctl g)
	let 'bright = bright / 266'
	brightness=$(printf "%.0f\n" $bright)
	dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "brightness-$1" "Brightness: $brightness%" -t 2000
}

case $1 in
up)
	brightnessctl s +5%
	send_notification $1
	;;
down)
	brightnessctl s 5%-
	send_notification $1
	;;
esac
