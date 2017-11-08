export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="xiong-chiamiov-plus"

HISTSIZE=1000
SAVEHIST=1000
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"

plugins=(git archlinux systemd vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
export LANG=fr_FR.UTF-8

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Default Programs
export EDITOR="vim"
export PAGER="less"
export BROWSER="firefox"
export PICVIEW="feh"
export SNDPLAY="mpv"
export MOVPLAY="mpv"
export TERMINAL="urxvtc"
# For ranger :terminal command
export TERMCMD="urxvtc"


for ext in com html net no org php;			do alias -s $ext=$BROWSER; done
for ext in PKGBUILD py tex txt;				do alias -s $ext=$EDITOR; done
for ext in bmp cdr gif ico jpeg jpg JPG png svg xpm;	do alias -s $ext=$PICVIEW; done
for ext in avi mkv mp4 mpg wmv;				do alias -s $ext=$MOVPLAY; done
for ext in flac mp3 ogg wav;				do alias -s $ext=$SNDPLAY; done
for ext in pdf;						do alias -s $ext="zathura"; done

# ALIASES & FUNCTIONS

cdl () { builtin cd "$1"; ls } # Ou bien ls -a ?

mkcd () { mkdir -pv "$1" && cd "$1"; }

xtract () {
	if [ -f "$1" ] ; then
		case "$1" in
			*.tar.bz2)	tar xvjf "$1"	;;
			*.tar.gz)	tar xvzf "$1"	;;
			*.tar.xz)	tar Jxvf "$1"	;;
			# *.bz2)		bunzip2 "$1"	;;
			# *.rar)		rar x "$1"	;;
			*.gz)		gunzip "$1"	;;
			*.tar)		tar xvf "$1"	;;
			*.tbz2)		tar xvjf "$1"	;;
			*.tgz)		tar xvzf "$1"	;;
			*.zip)		unzip "$1"	;;
			*.Z)		uncompress "$1"	;;
			#  *.7z)		7z x "$1"		;;
			*)		echo "I don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file !"
	fi
}

bu () {
	if [ -z "$2" ] ; then
		cp -r "$1" "$1".backup;
	else
		cp -r "$1" "$2"/"$1".backup;
	fi
}

alias cd='cdl'
alias lst='ls -Alth'
alias lstr='ls -Altrh'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root' # Do not delete / or prompt if deleting more than 3 files at a time
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias df='df -h'
alias du='du -ch'
alias biggest='du -x | sort -nr | head -10'
alias mountt='mount | column -t'

alias path='echo -e ${PATH//:/\\n}'

alias vi='vim'
alias more='less'
alias top='htop'
alias diff='vimdiff'

alias ping='ping -c 5'
alias wget='wget -c'
alias ports='sudo netstat -tulanp'
alias lsof='sudo lsof'
alias firewall='sudo iptables -L -n -v --line-numbers'

alias shutdown='sudo shutdown -hP now'
alias reboot='sudo reboot'

alias starwars='telnet towel.blinkenlights.nl'

alias eZ='vi ~/.zshrc && source ~/.zshrc'
alias eX='vi ~/.Xresources && xrdb -merge ~/.Xresources'
