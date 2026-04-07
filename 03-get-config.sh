#!/bin/bash
# Will download the configuration to config.yaml
source ./vars

echo "Downloading the configuration and saving it to config.yaml"

incus config show $INSTANCE > $CONFIG_FILE

echo "Completed"