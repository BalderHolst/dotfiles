scripts=$(cat ~/.config/bash/scripts.txt)

for script in $scripts
do
	type=$(echo $script | awk -F: '{print $1}')
	name=$(echo "$script" | awk -F/ {'print $NF'} | awk -F. {'print $1'})
	path=$(echo $script | awk -F: '{print $NF}')
	if [ "$type" = "f" ] 
	then
		eval "function $name() { $path \$@ ; }"
		eval "export -f $name"
	else
		eval "alias $name=$path"
	fi
done

# Navigation

alias scr='cd ~/.scripts'
alias SRP='cd ~/Documents/Skole/Gym/SRP'
#alias vimrc='nvim ~/.config/nvim/init.vim'
alias r=ranger



# launch scripts




# config management

gitconfig() { 
	/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME "$@"
}
export -f gitconfig

export CONFIGS_FILE="$HOME/.scripts/edit_configs/configs.txt"
