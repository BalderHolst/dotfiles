#!/bin/zsh

source $HOME/.scripts/dotgit/dotgit.sh

msg=$(dotgit commit -a -m "auto" && dotgit push)

notify-send "dotgit autopush" "$msg"
