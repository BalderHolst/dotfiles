#!/bin/zsh

source $HOME/.scripts/dotgit/dotgit.sh

dotgit commit -a -m "auto" | xargs -I{} notify-send "dotgit autopush" "{}"

notify-send "dotgit autopush" "$msg"
