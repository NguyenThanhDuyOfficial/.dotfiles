#!/usr/bin/bash

PIDFILE="/tmp/eww_countdowner.pid"

countdown() {
  echo "$BASHPID" > "$PIDFILE"
  trap pause_now SIGUSR1
  trap resume_now SIGUSR2

  PID=$(cat "$PIDFILE")
  echo "$PID"

  local total_min=$(echo "$1 * 60 - 1" | bc | cut -d'.' -f1)
  local min=59
  local hour=$(($total_min / 60))

  eww open countdowner

  while [ $min -ge 0 ]; do
    eww update countdowner_time="$hour:$min"
    ((min--))
    sleep 1m
  done
}

quit() {
  if [[ -f "$PIDFILE" ]]; then
    PID=$(cat "$PIDFILE")
    echo "$PID"
    if kill -0 "$PID" 2>/dev/null; then
      kill -TERM "$PID"
    else
      exit 1
    fi
    rm -f "$PIDFILE"
    eww close countdowner
  else
    exit 1
  fi
}

print_help(){
printf "SYNOPSIS:\n
    ./countdowner.sh [OPTION [...]]\n
OPTIONS:\n\n"
printf "  %-30s %s\n" "-s TIME(hour), --start TIME(hour)" "- Set TIME(hour) to countdown"
printf "  %-30s %s\n" "-q, --quit" "- Quit the countdown"
printf "  %-30s %s\n" "-h, --help" "- Show this message again"
}

OPTIONS=$(getopt --options=s:,q,h --longoptions=start:,quit,help --name "$0" -- "$@")

eval set -- "$OPTIONS"

while true; do
case "$1" in
  -s|--start)
    countdown "$2" &
    shift 2
  ;;
-q|--quit)
  quit
  shift
  ;;
  -h|--help)
    print_help
    shift
  ;;
  --)
    shift
    break
  ;;
  *)
    printf "countdowner: no options to do\n\n"
    print_help
    shift
  ;;
esac
done
