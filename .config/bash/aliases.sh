





# Navigation

alias scr='cd ~/.scripts'
alias SRP='cd ~/Documents/Skole/Gym/SRP'
#alias vimrc='nvim ~/.config/nvim/init.vim'
alias r=ranger



# launch scripts

function clatex() { ~/.scripts/clatex/clatex.sh ; }
alias mt=$HOME/.scripts/mt/mt.sh
alias ct=$HOME/.scripts/mt/ct.sh



# config management

gitconfig() { 
	/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME "$@"
}
export -f gitconfig

export CONFIGS_FILE="$HOME/.scripts/edit_configs/configs.txt"
function add_config() { ~/.scripts/edit_configs/add_config.sh ; }
function config() { ~/.scripts/edit_configs/config.sh ; }
export -f add_config
export -f config
