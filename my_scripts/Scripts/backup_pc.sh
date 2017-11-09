#!/bin/sh

BACKUP_DIR="Backup"
SCRIPTS_DIR="Scripts"
DOTFILES_DIR="dotfiles"

sh $HOME/$SCRIPTS_DIR/save_pacman_list.sh
tar -cjf $HOME/$BACKUP_DIR/$(hostname)-backup.tar.bz2 -C $HOME $BACKUP_DIR/pkg.list $BACKUP_DIR/aur.list $DOTFILES_DIR

