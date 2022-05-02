#!/bin/fish

set scripts "$(cat ~/.scripts/edit_configs/configs.txt)"

set names "$(echo $scripts | awk -F ' - ' '{print $1}')"

set choice "$(echo "$names" | dmenu)"

if [ "$choice" = "" ]
    echo "no choice"
    exit 1
end

echo "$scripts" | grep "$choice" | awk -F ' - ' '{print $NF}' | xargs -I{} kitty $EDITOR {}
