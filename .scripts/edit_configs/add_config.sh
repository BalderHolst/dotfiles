#!/bin/bash
# type: f

source "$HOME/.bash_aliases"

configs=$(find ~/ -name ".*"; echo "" ; tree -fit ~/.config)

file=$(echo "$configs" | dmenu -i -bw 1 -l 20 -p "add config file:") && name=$(echo "" | dmenu -p "program name:") && \
	echo "$name - $file" >> $CONFIGS_FILE && \
	gitconfig add $file && \
	notify-send "added config" "$name - $file" || \
	notify-send "configs" "failed to add config"
