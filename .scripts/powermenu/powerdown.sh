#!/bin/zsh

function prompt(){
    choice=$(echo -e "no\nyes" | dmenu -p "$@ - are you sure?") || exit 1
    
    if [[ $choice != "yes" ]]
    then
        exit 1
    fi
}

action=$(echo -e "log out\nsleep\nreboot\nrestart\npower off\nshutdown" | dmenu) || exit 1

case $action in 
"power off")
    prompt $action
    poweroff
    ;;
"shutdown")
    prompt $action
    poweroff
    ;;
"restart")
    prompt $action
    reboot
    ;;
"reboot")
    prompt $action
    reboot
    ;;
"log out")
    skill -KILL -u Balder
    ;;
"sleep")
    i3-msg exit
esac

#prompt $action
