#!/bin/bash

red="#ff0000"
blue="#77c0c6"
green="#00ff00"

info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

percentage=$(echo "$info" | grep "percentage" | awk '{ print $NF }')
state=$(echo "$info" | grep "state" | awk '{ print $NF }')

percentage_nr=$(echo "$percentage" | cut -d% -f1)

if [ $state = "charging"  ] ; then
	echo "<span color=\"$blue\">$percentage</span>"
elif [ $percentage_nr -lt 20  ] ; then
	echo "<span color=\"$red\">$percentage</span>"
else
	echo "$percentage"
fi


