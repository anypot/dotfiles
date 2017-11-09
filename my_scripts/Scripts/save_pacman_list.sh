#!/bin/sh
# To reinstall all packages in this file : pacman -S $(< pkg.list)

BACKUP_DIR="$HOME/Backup"

pacman -Qqne > $BACKUP_DIR/pkg.list
pacman -Qqme > $BACKUP_DIR/aur.list
