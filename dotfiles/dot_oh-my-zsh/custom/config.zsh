# To fix the error: gpg failed to sign the data
export GPG_TTY=$TTY

# Default Programs
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"
export BROWSER="firefox"
export READER="zathura"
export PICVIEW="imv"
export SNDPLAY="mpv"
export MOVPLAY="mpv"
export TERMINAL="alacritty"
# For yazi: terminal command
export TERMCMD="alacritty"
# For fzf (--unrestricted = --hidden --no-ignore)
export FZF_DEFAULT_COMMAND="fd --unrestricted --follow --exclude .git"
export FZF_DEFAULT_OPTS="
  --preview-window hidden
  --bind 'ctrl-space:toggle-preview'
  --color header:italic
  --header 'Press CTRL-SPACE to toggle preview'"
#   --bind 'ctrl-y:execute-silent(echo -n {} | wl-copy)+abort'
#   --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_CTRL_T_OPTS="
  --select-1
  --exit-0
  --preview '(bat {} || eza --tree --level=2 {}) 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND="fd --type directory --unrestricted --follow --exclude .git"
export FZF_ALT_C_OPTS="
  --select-1
  --exit-0
  --preview 'eza --tree --level=2 {}'"

for ext in md PKGBUILD py tex txt;                    do alias -s $ext=$EDITOR; done
for ext in com html net no org php;                   do alias -s $ext=$BROWSER; done
for ext in pdf;                                       do alias -s $ext=$READER; done
for ext in bmp cdr gif ico jpeg jpg JPG png svg xpm;  do alias -s $ext=$PICVIEW; done
for ext in flac mp3 ogg wav;                          do alias -s $ext=$SNDPLAY; done
for ext in avi mkv mp4 mpg wmv webm;                  do alias -s $ext=$MOVPLAY; done
