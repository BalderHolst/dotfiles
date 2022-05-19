#!/bin/zsh

file=$1

[[ -f "$file" ]] || eval 'echo "Please give mdplus a file" && exit 1'
[[ "$(echo $file | cut -d. -f2)" = "md" ]] || eval 'echo "Please give mdplus a MARKDOWN file" && exit 1'

name="$(echo "$file" | cut -d. -f1)"

pandoc "$file" -t ms -o "$name.pdf" || eval 'echo "converting failed" && exit 1'
