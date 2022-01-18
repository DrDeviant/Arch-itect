#!/bin/bash

source ../config.txt
 
# a forward slash, means copy directory contents only
DIR="$(cd "$(dirname "$0")" && pwd)"

# The source path to backup. Can be local or remote.
SOURCE=/home/$user
# Where to store the incremental backups
DESTBASE=pi:/mnt/sambacker/backedmeup
 
# Where to store today's backup
DEST="$DESTBASE/$(date +%Y-%m-%d)"
# Where to find yesterday's backup
YESTERDAY="$DESTBASE/$(date -d yesterday +%Y-%m-%d)/"
 
# Use yesterday's backup as the incremental base if it exists
if [ -d "$YESTERDAY" ]
then
	OPTS="--link-dest $YESTERDAY"
fi
 
# Run the rsync
time rsync -avAX -hP --exclude-from=$DIR/backupIgnoreList.txt --exclude '*.iso' --exclude '*lecture0-1080p*' "$SOURCE" "$DEST" 
echo "------------------Apex--------------------\n--------------------------------------"
echo "backing up /etc"
time rsync -avAX -hP  "/etc" "$DEST" 
