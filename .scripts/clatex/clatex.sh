#!/bin/bash

path_file=~/.scripts/clatex/path.txt


#cat $path_file | xargs -I{} notify-send test 'path: {}'



#cd /home/Balder/Documents/Skole/Gym/SRP/latex
p=`cat $path_file | rev | cut -d/ -f2- | rev`

cd $p
cat $path_file | xargs -I{} pdflatex {}

#pdflatex $dir_path$file_name.tex
#zathura $dir_path$file_name.pdf

echo done!
