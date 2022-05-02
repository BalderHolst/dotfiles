#!/bin/bash

paths=$(find ~/.scripts | grep '\.sh')

script_dir=$HOME/.config/script_links

rm $script_dir/*

for p in $paths
do
    filename=$(echo "$p" | awk -F/ {'print $NF'})

	name=$(echo "$filename" | awk -F. {'print $1'})
	extention=$(echo "$filename" | awk -F. {'print $NF'})
    
    
    echo "linking $name"

    echo -e "#!/bin/sh" > "$script_dir/$name"
    echo "$p \$@" >> "$script_dir/$name"
    chmod +x $script_dir/$name

done

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo "$SCRIPT_DIR/update_scripts.sh" > $script_dir/update_scripts
chmod +x $script_dir/update_scripts


