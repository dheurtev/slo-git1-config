#!/bin/bash
# Setup the crontab files for root
source ./vars

## Transfer the crontab files
### User crontab file
file="./files/crontab/crontab-user.txt"
echo "Pushing file $file to $INSTANCE in /home/$USER ..."
incus file push $file $INSTANCE/home/$USER/

## Add the content to crontab
### For user
echo "Setting up crontab for user file ..." 
incus exec $INSTANCE -- crontab /home/$USER/crontab-user.txt

echo "Completed"