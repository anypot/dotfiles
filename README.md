# Dotfiles

Here is my dotfiles management for my first Arch Linux laptop :)

![My Desktop](https://raw.github.com/anypot/dotfiles/master/desktop_scrot.png)

## Git + GNU stow = EZ backups
This repository is organized as a set of [stow](https://www.gnu.org/software/stow/) packages.

### How to

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
