# Git + GNU stow = EZ backups
Navigate to your home directory

`cd ~`

Clone the repo

`git clone https://github.com/anypot/dotfiles.git`

Enter the dotfiles directory

`cd dotfiles`

Install the zsh settings

`stow zsh`

Install the vim settings

`stow vim`

Etc... To symlink all of the config files

`for dir in */ ; do ; stow $dir ; done`
