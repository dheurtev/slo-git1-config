#!/bin/bash
# Copy the repo to the server
source ./vars

folder="./files/repo/srv-ct-gitea"
echo "Copying the service repo to $INSTANCE in /home/$USER ..."
incus file push -p -r $folder $INSTANCE/home/$USER/

echo "Completed"