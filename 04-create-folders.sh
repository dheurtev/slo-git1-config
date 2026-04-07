#!/bin/bash
# Create the local folders
source ./vars

echo "Creating the folder /home/$USER/backup-vols ..."
incus exec --user 1000 $INSTANCE --  mkdir /home/$USER/backup-vols

echo "Ensuring the folder /var/backup exists ..."
incus exec $INSTANCE -- mkdir /var/backups

echo "Completed"
