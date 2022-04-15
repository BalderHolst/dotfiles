#/bin/bash


# Aliases and functions for all scripts in ~/.scripts
source ~/.config/bash/scripts.sh


# Navigation
alias scr='cd ~/.scripts'
alias SRP='cd ~/Documents/Skole/Gym/SRP'
#alias vimrc='nvim ~/.config/nvim/init.vim'
alias r=ranger



# config management
dotgit() { /usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME "$@" ; }
export -f dotgit

export CONFIGS_FILE="$HOME/.scripts/edit_configs/configs.txt"
