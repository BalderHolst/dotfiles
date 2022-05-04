#!/bin/zsh

places="$HOME/.config/local-bookmarks.txt"

cat $places | dmenu -i -c -l 10 | awk -F ' - ' '{print $2}' | xargs -I{} kitty {}
