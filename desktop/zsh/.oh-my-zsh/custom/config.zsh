# To fix the error: gpg failed to sign the data
export GPG_TTY=$TTY

# Default Programs
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"
export BROWSER="firefox"
export READER="zathura"
export PICVIEW="sxiv"
export SNDPLAY="mpv"
export MOVPLAY="mpv"
export TERMINAL="alacritty"
# For ranger :terminal command
export TERMCMD="alacritty"

for ext in md PKGBUILD py tex txt;                   do alias -s $ext=$EDITOR; done
for ext in com html net no org php;                  do alias -s $ext=$BROWSER; done
for ext in pdf;                                      do alias -s $ext=$READER; done
for ext in bmp cdr gif ico jpeg jpg JPG png svg xpm; do alias -s $ext=$PICVIEW; done
for ext in flac mp3 ogg wav;                         do alias -s $ext=$SNDPLAY; done
for ext in avi mkv mp4 mpg wmv;                      do alias -s $ext=$MOVPLAY; done
