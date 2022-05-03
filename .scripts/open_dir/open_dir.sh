#!/bin/zsh

places="$HOME/.scripts/open_dir/places.txt"

cat $places | dmenu -i -c -l 10 | awk -F ' - ' '{print $2}' | xargs -I{} kitty ranger {}
