#!/bin/bash
# Setup the crontab files for the user
source ./vars

## Transfer the crontab files
file="./files/crontab/crontab-root.txt"
echo "Pushing file $file to $INSTANCE in /root/ ..."
incus file push $file $INSTANCE/root/

## Add the content to crontab
### For root
echo "Setting up crontab for root file ..." 
incus exec $INSTANCE -- sudo crontab /root/crontab-root.txt

echo "Completed"