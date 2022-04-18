#/bin/bash


# Aliases and functions for all scripts in ~/.scripts
source ~/.config/bash/scripts.sh


# Navigation
alias scr='cd ~/.scripts'
alias SRP='cd ~/Documents/Skole/Gym/SRP'
alias ..='cd ..'
alias ...='cd ...'


#alias vimrc='nvim ~/.config/nvim/init.vim'
alias r=ranger



# config management
dotgit() { /usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME "$@" ; }
export -f dotgit

export CONFIGS_FILE="$HOME/.scripts/edit_configs/configs.txt"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
