#!/bin/bash
#type: f


if [[ $(echo $1 | wc --chars) -lt 2 ]]; then	
	echo "ERROR: no file provided" ; exit 1
fi

places=$(cat "$HOME/.config/local-bookmarks.txt")

place=$(echo "$places" | fzf --reverse --padding 8% --prompt "move $1 to: " | sed "s|~|$HOME|g" ; )

name="$(echo "$place" | awk -F ' - ' '{ print $1 }')"

cp -i "$1" "$(echo "$place" | awk '{ print $NF }')/" \
	&& echo "copied $1 to $name" \
	|| echo "ERROR: failed to copy file." ; exit 1



