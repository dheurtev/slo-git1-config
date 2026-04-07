#!/bin/bash
# Add github key
source ./vars

echo "Adding $SSH_KEY to $INSTANCE ..."

incus exec $INSTANCE -- ssh-import-id $SSH_KEY

echo "Completed"