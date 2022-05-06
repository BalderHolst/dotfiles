#!/bin/zsh

file=$(echo $@ | sed 's/ /\\ /g')

case $file in
    *.pdf) swallow zathura $file ;;
    *.png) swallow sxiv $file ;; 
    *.jpg) swallow sxiv $file ;; 
    *) nvim $file
esac
