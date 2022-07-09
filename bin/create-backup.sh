#!/bin/bash
set -e

REPOSITORY=/Users/caesar/backups
export BORG_PASSCOMMAND='pass show BorgBackup'

#Bail if borg is already running, maybe previous run didn't finish
if pgrep borg >/dev/null; then
    echo "Backup already running"
    exit
fi


hostname=`hostname`
backup_name=`date "+$(hostname)_%Y-%m-%d_%H.%M.%S"`

borg --progress create --stats --compression auto,lzma \
    $REPOSITORY::$backup_name \
    ~/Documents/Important \
    ~/Pictures/Album

echo $REPOSITORY::$backup_name

