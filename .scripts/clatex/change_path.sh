#echo "Path to main .tex file: "

read -p "Path to main .tex file: " IN

echo ${IN/\~/\/home\/Balder}

if [ -f "${IN/\~/\/home\/Balder}" ]; then
	echo "it IS a file!"
	echo "${IN/\~/\/home\/Balder}" > ~/.scripts/clatex/path.txt
	~/.scripts/clatex/clatex.sh
else
	echo "it is not a file... aborting."
fi
