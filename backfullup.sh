
#!/bin/bash
 
# a forward slash, means copy directory contents only
DIR="$(cd "$(dirname "$0")" && pwd)"

#cat $DIR/backupIgnoreList.txt
#exit
# The source path to backup. Can be local or remote.
SOURCE=/home/rdkang
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
rsync -avAX -hP --exclude-from=/home/rdkang/Documents/archform/backupIgnoreList.txt --exclude '*.iso' --exclude '*lecture0-1080p*' "$SOURCE" "$DEST" 
echo "backing up /etc"
rsync -avAX -hP  "/etc" "$DEST" 
