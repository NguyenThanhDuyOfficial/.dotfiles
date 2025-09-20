#!/usr/bin/bash

scripts=~/.config/scripts/

sleep 1s
$scripts/volume.sh -i
$scripts/bright.sh -i

$scripts/workspaces.sh ## Always leave this line in the bottom
