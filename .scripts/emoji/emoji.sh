#!/bin/zsh

# source: https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/dmenuunicode

# The famous "get a menu of emojis to copy" script.

# Get user selection via dmenu from emoji file.
chosen=$(cut -d ';' -f1 ~/.scripts/emoji/emoji/* | dmenu -i -c -l 30 | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	printf "$chosen" | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard."
	xdotool type "$chosen"
fi
#!/bin/zsh
