#!/usr/bin/bash
eww=$HOME/repos/eww/target/release/eww

current=$(brightnessctl g)
max=$(brightnessctl m)

brightness_value=$((current * 100 / max))

"$eww" update brightness_value=$brightness_value
