#!/bin/sh
# To restore
# tar -xjvf /home/tony/Backup/etc-backup.tar.bz2 -C /

BACKUP_DIR="$HOME/Backup"
SCRIPTS_DIR="$HOME/Scripts"

tar -cjf $BACKUP_DIR/etc-backup.tar.bz2 /etc
tar -cjf $BACKUP_DIR/home-backup.tar.bz2 -X $SCRIPTS_DIR/excludesavehome.txt $HOME
tar -cjf $BACKUP_DIR/pacman-database.tar.bz2 /var/lib/pacman/local
