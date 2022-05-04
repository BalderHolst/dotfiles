#!/bin/zsh

[[ "$@" = "" ]] && echo "please give bookmark a name" && exit 1

bfile=$HOME/.config/local-bookmarks.txt



case $1 in
    "list")
        echo "NAME - PATH" ; echo "-----------------------------" ; cat $bfile ; exit 0
        ;;
    "edit")
        $EDITOR $bfile ; exit 0
        ;;
    "rm")
        [[ "$2" = "" ]] && echo "bmark rm requires a bookmark name or path" && exit 1
        bname=$(cat $bfile | awk -F ' - ' '{print $1}' | grep $2) || eval 'echo "no bookmark match for name \"$2\". Use bmark list to list bookmarks and names" ; exit 1'

        echo "$bname"
        grep "e" $bfile
        #sed -i /$(grep "$bname - " $bfile)/d  $bfile
esac



bmark="$@ - $(pwd)"

echo "$bmark" >> $bfile && echo "Created bookmark: $bmark"
