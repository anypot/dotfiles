#!/bin/sh
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
list=$(mktemp)
wget 'https://www.archlinux.org/mirrorlist/?country=FR&protocol=http&ip_version=4&use_mirror_status=on' -O $list
sed -i 's/^#S/S/g' $list
cat $list > /etc/pacman.d/mirrorlist
