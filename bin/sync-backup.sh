#!/bin/bash
set -e

repos=( backups )

#Bail if rclone is already running, maybe previous run didn't finish
if pgrep rclone >/dev/null; then
    echo "Process already running"
    exit
fi

for i in "${repos[@]}"
do
#     #Lets see how much space is used by directory to back up
#     #if directory is gone, or has gotten small, we will exit
#     space=`du -s /mnt/backup/$i|awk '{print $1}'`
# 
#     if (( $space < 34500000 )); then
#        echo "EXITING - not enough space used in $i"
#        exit
#     fi

    echo "Syncing repo $i"
    rclone -v sync /Users/caesar/$i wasabi:cjwirth-$i >> /Users/caesar/borg/wasabi-sync.log 2>&1
done

