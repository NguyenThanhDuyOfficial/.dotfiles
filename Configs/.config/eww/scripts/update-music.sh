#!/usr/bin/env bash

playerctl --follow metadata --format '{ "title": "{{xesam:title}}", "artUrl": "{{mpris:artUrl}}" }' \
| while read -r line; do
    echo "$line"
done

