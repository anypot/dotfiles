alias cat='bat'
alias more='less'
alias top='htop'
alias vi='nvim'
alias diff='nvim -d'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias ssh='TERM=rxvt-256color ssh'

# exa
alias ls='eza'                                                         # ls
alias l='eza -lbF --git'                                               # list, size, type, git
alias ll='eza -lbGF --git'                                             # long list
alias llm='eza -lbGF --git --sort=modified'                            # long list, modified date sort
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='eza -1'                                                      # one column, just names
alias lt='eza --tree --level=2'                                        # tree

# Misc
alias weather='curl wttr.in'
