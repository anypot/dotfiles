alias cat='bat'
alias more='less'
alias top='htop'
alias vi='nvim'
alias diff='nvim -d'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias ssh='TERM=rxvt-256color ssh'

# exa
alias ls='exa'                                                         # ls
alias l='exa -lbF --git'                                               # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='exa -1'                                                      # one column, just names
alias lt='exa --tree --level=2'                                        # tree

# Misc
alias weather='curl wttr.in'
