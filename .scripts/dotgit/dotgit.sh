#!/bin/zsh

dotgit() { /usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME "$@" ; }

case $1 in
    "cp")
        if [[ "$2" = "" ]] ; then
            echo "please enter commit message after \"dotgit cp\""
            exit 1
        fi
        dotgit commit -a -m "$2" && dotgit push
        exit 0
        ;;
    "c")
        dotgit commit -a -m "$2"
        exit 0
esac




dotgit "$@"
