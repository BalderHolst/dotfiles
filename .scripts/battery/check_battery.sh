#!/bin/zsh

[[ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]] && echo "Charging" && exit 0

[[ $(cat /sys/class/power_supply/BAT0/capacity) -lt 12 ]] && /usr/bin/notify-send -u critical -t 5000 "Low Battery!" "Plug in your computer" && mpv --volume=130 --no-video $HOME/.scripts/battery/low_battery1.wav \
    || echo "power ok"


exit 0
