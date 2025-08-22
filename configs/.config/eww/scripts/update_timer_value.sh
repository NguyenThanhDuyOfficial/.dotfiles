#!/usr/bin/env bash

STATE_FILE=/tmp/eww_timer_state
MIN_FILE=/tmp/eww_timer_min


stop_timer(){
  echo false > "$STATE_FILE"
}

run_timer() {

  if [[ $(cat "$STATE_FILE") == true ]]; then
    echo "It is running."
    exit 1
  fi

  if [[ -f "$MIN_FILE" ]]; then
    min=$(cat "$MIN_FILE")
  fi

  echo true > "$STATE_FILE"
  
  while true; do
    if [[ $(cat "$STATE_FILE") == false ]]; then
      echo $min > "$MIN_FILE"
      break
    fi

    min=$((min+1))

    timer_min=$(printf "%02d" $((min % 60)))
    timer_hour=$(printf "%02d" $((min / 60)))

    eww update timer_min=$timer_min
    eww update timer_hour=$timer_hour

    sleep 1m
  done
}

case "$1" in
  -r|--run)
    run_timer
    ;;
  -s|--stop)
    stop_timer
    ;;
  *)
    echo "Usage: $0 [-r|--run] [-s|--stop]"
    exit 2
  ;;
esac
