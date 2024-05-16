#!/bin/bash
# The source path to backup. Can be local or remote.
SOURCE=/home/yannick/
# Where to store the incremental backups
DESTBASE=/media/save/yannick@DragonFly
FILELIST_TO_EXCLUDE=/home/yannick/rsync_backup/toexclude.txt

OPTS="--exclude-from ${FILELIST_TO_EXCLUDE}"

echo "Backup start $(date)"

if [ -w $DESTBASE ]; then

   # Where to store today's backup
   DEST="$DESTBASE/"$(date +%Y-%m-%d-%H:%M:%S)
   # Where to find last completed
   #YESTERDAY="$DESTBASE/$(date -d yesterday +%Y-%m-%d)/"
   LAST_COMPLETE=$(dirname $(ls -tr $DESTBASE/*/RSYNC_COMPLETED_AT_*|tail -n 1))

   # Use last backup as the incremental base if it exists
   if [ -d "${LAST_COMPLETE}" ]
   then
	   OPTS="$OPTS --link-dest ${LAST_COMPLETE}"
   fi

   # Run the rsync
   rsync -av $OPTS "$SOURCE" "$DEST"

   if [ $? -eq 0 ] ; then
	   touch "$DEST"/RSYNC_COMPLETED_AT_$(date +%Y-%m-%d-%H:%M:%S)
	   /usr/bin/notify-send -u low "Backup completed" "$DEST"
   else
	   /usr/bin/notify-send -u critical "Backup incomplete" "$DEST"
   fi

else
	/usr/bin/notify-send -u normal "Backup destination unwritable" "$DEST"
fi

echo "Backup end $(date)"
