#!/usr/bin/env bash
TIME=$((5 * 60))
function change_wallpaper() {
  awww img ~/.config/wallpapers/1.png
  sleep $TIME
  awww img ~/.config/wallpapers/2.png
  sleep $TIME
  awww img ~/.config/wallpapers/3.png
  sleep $TIME
  awww img ~/.config/wallpapers/4.png
  sleep $TIME
  awww img ~/.config/wallpapers/5.png
  sleep $TIME
  awww img ~/.config/wallpapers/6.png
  sleep $TIME

  change_wallpaper
}

change_wallpaper
