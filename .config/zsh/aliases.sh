#/bin/sh



alias ls=lsd
alias ll='lsd -l'

# Navigation
alias scr='cd ~/.scripts'
alias ..='cd ..'
alias ...='cd ...'

# Bookmarks
source $HOME/.config/bookmarks/baliases.sh

alias r=ranger
alias mail=neomutt

# git
alias gs='git status'
alias gc='git commit'

# Groff
alias groffpdf='groff -ms -Tpdf'

export CONFIGS_FILE="$HOME/.scripts/edit_configs/configs.txt"

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

topdf () {
    name="$(echo "$1" | cut -d. -f1).pdf"
    pandoc -o "$name" "$1"
    swallow zathura "$(echo "$name" | sed 's/ /\\ /g')"
}
