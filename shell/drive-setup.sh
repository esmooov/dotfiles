DRIVE=$1
MOUNT_PATH=/mnt/$1

DRIVE_UUID=`blkid | grep -P 'LABEL=\"$DRIVE\"' | awk -F '"' '{ print $4 }'`
USER_ID=`id -u`
GROUP_ID=`id -g`

FSTAB_RECORD="UUID=$DRIVE_UUID $MOUNT_PATH ntfs-3g uid=$USER_ID,gid=$GROUP_ID,umask=0022,async,auto,rw 0 0"

echo $FSTAB_RECORD
