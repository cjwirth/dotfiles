#!/bin/bash
echo Creating and syncing backups.
echo Creating
create-backup.sh
echo Syncing
sync-backup.sh
echo Done!

