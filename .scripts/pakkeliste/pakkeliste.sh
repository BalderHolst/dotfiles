#!/bin/zsh

pakkeliste_dir="$HOME/.config/pakkelister"

name=`pwd | awk -F/ '{ print $NF }'`

start_pakkeliste="$(ls "$pakkeliste_dir" | fzf --reverse --padding 8% --prompt "Pakkelisteudgangspunkt: ")"

start_pakkeliste_file="$pakkeliste_dir/$start_pakkeliste"

cp "$start_pakkeliste_file" "$pakkeliste_dir/$name.md"

ln -s "$pakkeliste_dir/$name.md" pakkeliste.md

$EDITOR pakkeliste.md
