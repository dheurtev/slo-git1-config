#!/bin/bash
# Utility to control the Incus container or virtual machine
source ./vars

# Get the first positional argument
arg1=$1

# Switch statement in bash
case $arg1 in
  "launch")
    incus create $IMAGE $INSTANCE -d $DISK --type $TYPE --profile $PROFILE --config=cloud-init.user-data="$(cat $USER_DATA_FILE)"  --config=cloud-init.network-config="$(cat $NET_CONFIG_FILE)"  $VM
    ;;
  "launch-console")
    incus launch $IMAGE $INSTANCE -d $DISK --type $TYPE --profile $PROFILE --config=cloud-init.user-data="$(cat $USER_DATA_FILE)"  --config=cloud-init.network-config="$(cat $NET_CONFIG_FILE)"  $VM --console
    ;;
  "create")
    incus create $IMAGE $INSTANCE -d $DISK --type $TYPE --profile $PROFILE --config=cloud-init.user-data="$(cat $USER_DATA_FILE)"  --config=cloud-init.network-config="$(cat $NET_CONFIG_FILE)"  $VM
    ;;
  "start")
    incus start $INSTANCE
    ;;
  "start-console")
    incus start $INSTANCE --console
    ;;
  "stop")
    incus stop $INSTANCE
    ;;
  "pause")
    incus pause $INSTANCE
    ;;
  "resume")
    incus resume $INSTANCE
    ;;
  "reboot")
    incus restart $INSTANCE
    ;;
  "poweroff")
    incus stop --force $INSTANCE
    ;;
  "delete")
    incus delete $INSTANCE
    ;;
  "destroy")
    incus delete $INSTANCE --force
    ;;
  "status")
    incus status $INSTANCE
    ;;
  "info")
    incus info $INSTANCE
    ;;
  "top")
    incus top $INSTANCE
    ;;
  "show-config")
    incus config show $INSTANCE
    ;;
  "console")
    incus console $INSTANCE
    ;;
  "vga")
    incus console $INSTANCE --type vga
    ;;
  "autosnap")
    SNAPSHOT_NAME="s$(date +%Y%m%d%H%M%S)"
    incus snapshot create $INSTANCE SNAPSHOT_NAME
    ;;
  *)
    echo "Invalid command. Please use 'launch', 'launch-console', 'create', 'start', 'start-console', 'stop', 'pause', 'resume', 'reboot', 'poweroff', 'delete', 'destroy', 'status', 'info', 'top', 'show-config', 'console', 'vga', 'autosnap'."
    exit 1
    ;;
esac


