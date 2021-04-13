#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

#xset +fp /usr/share/fonts/local
#xset fp rehash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

urxvtd -q -f -o
eval $(gpg-agent --daemon) &

# Hide the cursor when not used
unclutter -grab -noevents -root &

# Use a basic cursor
xsetroot -cursor_name left_ptr &

# Disable the beeeeeeeep !!
xset b off &

sxhkd -m 1 &
sh ~/.fehbg
compton -b --config ~/.config/compton.conf
exec bspwm

# If using SLIM
#case "$1" in
#	bspwm) sxhkd & ;;
#	*) ;; # xbindkeys si autre wm
#esac
#exec $1
