#!/usr/bin/bash
eww=$HOME/repos/eww/target/release/eww

volume_value=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d", $2 * 100}')
"$eww" update volume_value=$volume_value
