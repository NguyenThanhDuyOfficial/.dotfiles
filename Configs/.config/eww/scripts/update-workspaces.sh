#!/usr/bin/bash

active_workspace=0
workspaces=(0 0 0 0 0 0)
handle() {
  case $1 in
  "workspace>>"*)
    workspaces[$active_workspace - 1]=0
    active_workspace="${1#*>>}"
    workspaces[$active_workspace - 1]=1
    json_array=$(
      IFS=,
      echo "[${workspaces[*]}]"
    )
    eww update workspaces=$json_array
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
