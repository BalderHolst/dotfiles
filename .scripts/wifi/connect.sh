#!/bin/bash

notify-send Wifi "Searching for connections..."

devs=$(nmcli d wifi list | sed 's/  \+/:/g' | sed 's/ Mbit/:Mbit/g')
#devs=$(cat $HOME/.scripts/wifi/sample_wifis.txt | sed 's/  \+/:/g' | sed 's/ Mbit/:Mbit/g')

choice=$(echo "$devs" | awk -F ':' '{print $8 " (" $11 "mb/s)"}' | grep -v "^--\|BARS" | dmenu -i -c -l 30) || exit 1

name=$(echo "$devs" | grep $(echo "$choice" | awk '{print $1}') | awk -F: '{print $8}' | head -n 1)


nmcli d wifi connect "$name"

