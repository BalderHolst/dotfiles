#!/bin/bash

paths=$(find ~/.scripts | grep -E '\.sh|\.py')


for path in $paths
do
    t=$(head -n 5 $path | grep 'type:' | awk {'print $NF'})

    filename=$(echo "$path" | awk -F/ {'print $NF'})

	name=$(echo "$filename" | awk -F. {'print $1'})
	extention=$(echo "$filename" | awk -F. {'print $NF'})
    
    
    runner=""
    if [[ "$extention" = "py" ]]; then
        runner="python "        
    fi

    echo "linking $name"

    echo "$runner$path \$@" > $script_dir/$name
    chmod +x $script_dir/$name

done

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo "$SCRIPT_DIR/update_scripts.sh" > $script_dir/update_scripts
chmod +x $script_dir/update_scripts


