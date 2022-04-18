#!/bin/bash
# type: f

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

structure=$(cat .structure.json) || exit 1

path=$(echo "$structure" | grep "main.tex" | sed s/,//g | sed s/\"//g | sed s/\ //g)
out=$(echo "$structure" | grep "out\"" | sed s/,//g | sed s/\"//g | sed s/\ //g)


pdflatex -output-dir "$out" "$path"

