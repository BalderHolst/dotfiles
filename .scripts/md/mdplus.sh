#!/bin/zsh



file=$1

[[ -f "$file" ]] || eval 'echo "Please give mdplus a file" && exit 1'
[[ "$(echo $file | cut -d. -f2)" = "md" ]] || eval 'echo "Please give mdplus a MARKDOWN file" && exit 1'

name="$(echo "$file" | cut -d. -f1)"

ls | grep "$name".pdf &>/dev/null || pandoc "$file" -t ms -o "$name.pdf"

echo "$(pwd)/$file"


nvim "$file" \
    & zathura "$name.pdf" \
    # & inotifywait -me modify "$(pwd)" | \
    # while read mfile; do (notify-send "File udated: $mfile"&) done
