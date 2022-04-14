#!/bin/bash


if [[ $(echo $1 | wc --chars) -lt 2 ]]; then	
	echo "ERROR: no file provided" ; exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

places=$(cat "$SCRIPT_DIR/places.txt")

place=$(echo "$places" | fzf --reverse --padding 8% --prompt "move $1 to: " | sed "s|~|$HOME|g" ; )

name="$(echo "$place" | awk '{ print $1 }')"

mv -i "$1" "$(echo "$place" | awk '{ print $NF }')/" \
	&& echo "moved $1 to $name" \
	|| echo "ERROR: failed to move file." ; exit 1



