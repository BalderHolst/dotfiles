
ms=".TL
Shortcuts"

function wrap () {
    echo -e "\n.SH\n$1"
    echo "$2" | xargs -I{} echo -e ".IP\n{}"
}

function parsei3 () {
    file=$HOME/.config/i3/config
    echo -e "$(grep '^bind' $file | sed 's/bindsym \|--no-startup-id //g' | sed 's/$mod/Super/g')\n"
}

ms="$ms""$(wrap i3 "$(parsei3)")"


echo "$ms" | groff -ms -Tpdf | zathura -
