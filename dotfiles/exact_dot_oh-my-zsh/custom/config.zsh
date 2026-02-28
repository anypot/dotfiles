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

# For ZVM (Zsh-Vi-Mode)
ZVM_SYSTEM_CLIPBOARD_ENABLED=true
ZVM_VI_EDITOR="nvim"
# ZVM_VI_SURROUND_BINDKEY="s-prefix" # To work like in nvim (sa/sr/sd like gsa/gsr/gsd in nvim)
ZVM_CURSOR_STYLE_ENABLED=false
ZVM_VI_HIGHLIGHT_BACKGROUND=white
ZVM_VI_HIGHLIGHT_FOREGROUND=black
_omp_redraw-prompt() {
  local precmd
  for precmd in "${precmd_functions[@]}"; do
    "$precmd"
  done
  zle && zle reset-prompt
}
export POSH_VI_MODE="$(printf '❯')"
function define_cursor_from_zvm_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      POSH_VI_MODE="$(printf '❮')"
      ;;
    $ZVM_MODE_INSERT)
      POSH_VI_MODE="$(printf '❯')"
      ;;
    $ZVM_MODE_VISUAL)
      POSH_VI_MODE="$(printf 'Ⅴ')"
      ;;
    $ZVM_MODE_VISUAL_LINE)
      POSH_VI_MODE="$(printf 'Ⅴ')"
      ;;
    $ZVM_MODE_REPLACE)
      POSH_VI_MODE="$(printf '▶')"
      ;;
  esac
  _omp_redraw-prompt
}
zvm_after_select_vi_mode_commands+=(define_cursor_from_zvm_mode)

for ext in md PKGBUILD py tex txt;                    do alias -s $ext=$EDITOR; done
for ext in com html net no org php;                   do alias -s $ext=$BROWSER; done
for ext in pdf;                                       do alias -s $ext=$READER; done
for ext in bmp cdr gif ico jpeg jpg JPG png svg xpm;  do alias -s $ext=$PICVIEW; done
for ext in flac mp3 ogg wav;                          do alias -s $ext=$SNDPLAY; done
for ext in avi mkv mp4 mpg wmv webm;                  do alias -s $ext=$MOVPLAY; done
for ext in odt doc docx;                              do alias -s $ext="libreoffice --writer"; done
for ext in ods xls xlsx;                              do alias -s $ext="libreoffice --calc"; done
for ext in odp ppt pptx;                              do alias -s $ext="libreoffice --impress"; done
