# To fix the error: gpg failed to sign the data
export GPG_TTY=$TTY

# Default Programs
export EDITOR="nvim"
export PAGER="less"
export BROWSER="firefox"
export TERMINAL="alacritty"
# For ranger :terminal command
export TERMCMD="alacritty"

for ext in com html net no org php pdf; do alias -s $ext=$BROWSER; done
for ext in PKGBUILD py tex txt;	        do alias -s $ext=$EDITOR; done