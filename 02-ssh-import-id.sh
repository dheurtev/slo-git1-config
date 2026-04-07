#!/bin/bash
# Add github key
source ./vars

echo "Adding $SSH_KEY to $INSTANCE ..."

incus exec $INSTANCE -- "su $USER && ssh-import-id $SSH_KEY"

echo "Completed"
