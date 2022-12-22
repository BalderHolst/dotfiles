#/bin/sh

alias od='nvim "$(pwd)" -c "Telescope find_files"'

alias ls=lsd
alias ll='lsd -l'

# Navigation
alias ..='cd ..'
alias ...='cd ...'

# search history
h() { $(history  | fzf | cut -d ' ' -f5-) }

cdn() { mkdir -p "$1" && cd "$1" }

# Bookmarks
source $HOME/.config/bookmarks/baliases.sh

alias r=ranger
alias mail=neomutt

# nvim
alias n='nvim'

# Dublicate
alias d='kitty --detach'

# To pdf
alias topdf='libreoffice --convert-to pdf'

# git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gaa='git add .'
alias gca='git add . && git commit'

# Arduino
alias ino='arduino-cli'

# Python
alias py='bpython'

# Groff
alias groffpdf='groff -ms -Tpdf'

export CONFIGS_FILE="$HOME/.scripts/edit_configs/configs.txt"

# HDMI
alias hdmi-dublicate='xrandr --output HDMI-A-0 --auto --same-as eDP'

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
