#!/bin/bash
# Add github key
source ./vars

echo "Adding $SSH_KEY to $INSTANCE ..."

incus exec --user 1000 $INSTANCE -- ssh-import-id $SSH_KEY

echo "Completed"
