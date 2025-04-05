# Filesystem navigation
cdl () { builtin cd "$1"; ls -a }
mkcd () { mkdir -pv "$1" && cd "$1" }
dot() { builtin cd ~/dotfiles; nvim }
alias ls='eza'                                                         # ls
alias l='eza -lbF --git'                                               # list, size, type, git
alias ll='eza -lbGF --git'                                             # long list
alias llm='eza -lbGF --git --sort=modified'                            # long list, modified date sort
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='eza -1'                                                      # one column, just names
alias tree='eza --tree --level=2'                                        # tree
alias df='df -h'
alias du='du -ch'
alias biggest='du -x | sort -nr | head -10'
alias mountt='mount | column -t'

# R/W files
bu() { [[ -z "$2" ]] && cp -r "$1" "$1".backup || cp -r "$1" "$2"/"$1".backup }
alias rm='rm -I --preserve-root' # Do not delete / or prompt if deleting more than 3 files at a time
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cat='bat'
alias more='less'
alias vi='nvim'
alias diff='nvim -d'
alias -s {yml,yaml,sh,zsh}=nvim
alias -g F='| fzf'

# System
alias top='htop'
alias path='echo -e ${PATH//:/\\n}'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias ssh='TERM=rxvt-256color ssh'

# Misc
alias c=clear
alias weather='curl wttr.in'
