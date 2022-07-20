#!/bin/sh

echo "Script in $(pwd) was used!"

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


	if [ "$t" = "f" ] 
	then
		eval "function $name() { $runner$path \$@ ; }"
		eval "export -f $name"
    elif [ "$t" = "n" ]
    then
        :
    else
		eval "alias $name='$runner$path'"
	fi
done


