#!/usr/bin/env bash

IMAGE_PATH="${1:-$HOME/.config/wallpapers/girl/}"

if [ ! -d "$IMAGE_PATH" ]; then
  echo "ERR: Folder $IMAGE_PATH not exists"
  exit 1
fi

mapfile -t files < <(find "$IMAGE_PATH" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \))

if [ ${#files[@]} -eq 0 ]; then
  echo "ERR: No image files found."
  exit 1
fi

while true; do
  for file in "${files[@]}"; do
    echo "awww img $file"
    awww img $file
    sleep 1m
  done
done
