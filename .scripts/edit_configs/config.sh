#!/bin/bash
# type: f

edit_cmd="kitty nvim"

add="add_config"


configs=$(echo "$add"; echo "configs - $configs_file" ; cat "$CONFIGS_FILE") 

choice=$(echo "$configs" | awk '{ print $1 }' | dmenu -p "open config:") && \
	if [ "$add" == "$choice" ]; then
		~/.scripts/edit_configs/add_config.sh
	elif [ "$choice" == "configs" ]; then
		$edit_cmd $CONFIGS_FILE
	else
		$edit_cmd $(cat "$CONFIGS_FILE" | grep $choice | awk '{ print $3 }')
	fi
