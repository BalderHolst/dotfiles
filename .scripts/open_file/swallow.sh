#!/bin/zsh

terminalid=$(xdotool getactivewindow)

xdotool windowunmap $terminalid

eval "$@" > /dev/null

xdotool windowmap $terminalid
