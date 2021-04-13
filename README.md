# Dotfiles

Here is my dotfiles management for my first Arch Linux laptop :)

![My Desktop](https://raw.github.com/anypot/dotfiles/master/desktop_scrot.png)

## Git + GNU stow = EZ backups
This repository is organized as a set of [stow](https://www.gnu.org/software/stow/) packages.

### How to

Clone the repo in your home directory

`cd $HOME && git clone https://github.com/anypot/dotfiles.git`

Install the laptop zsh settings

`stow zsh -d dotfiles/laptop -t $HOME`

Install the laptop vim settings

`stow vim -d dotfiles/laptop -t $HOME`

Etc... To symlink all of the desktop config files (usable from any directory !)

`for dir in $HOME/dotfiles/desktop/*; do stow $(basename $dir) -d $HOME/dotfiles/desktop -t $HOME; done`
