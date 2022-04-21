#!/bin/bash
#type: a

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

python "$SCRIPT_DIR/latex_init.py" "$@"

source ~/.bash_aliases

clatex

