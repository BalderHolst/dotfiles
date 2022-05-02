#!/bin/zsh

places="$HOME/.scripts/open_dir/places.txt"

cat $places | dmenu -i -c -l 10 | xargs -I{} kitty $HOME/{}
