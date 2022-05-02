#!/bin/zsh


file=$(find $HOME/Downloads -type f | sed 's/\/home\/Balder\/Downloads\///g' | fzf --reverse --padding 8% --prompt "move $1 to: ") || exit 1

echo "moving $file here..."

mv "$HOME/Downloads/$file" .

#places=$(cat "$SCRIPT_DIR/places.txt")


#echo "$places" | fzf --reverse --padding 8% --prompt "move $1 to: " 


