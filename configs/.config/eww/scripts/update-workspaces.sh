#!/usr/bin/env bash

activeWorkspace=0
workspaces=(0 0 0 0 0 0)

handle() {
  case $1 in
  "workspace>>"*)

    workspaces[$activeWorkspace - 1]=0
    activeWorkspace="${1#*>>}"
    workspaces[$activeWorkspace - 1]=1

    json_array=$(
      IFS=,
      echo "[${workspaces[*]}]"
    )

    eww update workspaceArray=$json_array
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
