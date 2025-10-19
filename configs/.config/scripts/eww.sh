#!/usr/bin/bash

scripts=~/.config/scripts/

sleep 2s
$scripts/volume.sh -i
$scripts/bright.sh -i

$scripts/workspaces.sh ## Always leave this line in the bottom
