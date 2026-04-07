#!/bin/bash
# Clone the service config repo to ./files/repo/srv-ct-gitea
source ./vars

git_source="git@github.com:dheurtev/srv-ct-gitea.git"

echo "Cloning $git_source to ./files/repo ..."
git clone $git_source ./files/repo/srv-ct-gitea

echo "Completed"