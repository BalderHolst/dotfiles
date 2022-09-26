#!/bin/bash

[[ $(task minimal | wc -l) = 0 ]] &>/dev/null && exit 0

task minimal | lolcat
