#!/usr/bin/bash

PIDFILE="/tmp/eww_countdowner.pid"

countdown() {
  if [[ -f "$PIDFILE" ]]; then
    echo "There is another countdowner running"
    exit 1
  fi

  echo "$BASHPID" > "$PIDFILE"
  trap pause_now SIGUSR1
  trap resume_now SIGUSR2

  PID=$(cat "$PIDFILE")
  echo "$PID"

  local hour=$1
  local min=$2

  eww open countdowner

  while [[ "$hour" -ge 0 ]]; do
    if [[ "$min" -eq 0 ]]; then
      ((hour--))
      min=59
    fi
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
  printf "  %-30s %s\n" "-s hour min, --start hour min" "- Set TIME(hour) to countdown"
  printf "  %-30s %s\n" "-q, --quit" "- Quit the countdown"
  printf "  %-30s %s\n" "-h, --help" "- Show this message again"
}

OPTIONS=$(getopt --options=s:,q,h --longoptions=start:,quit,help --name "$0" -- "$@")

eval set -- "$OPTIONS"

while true; do
case "$1" in
  -s|--start)
    time_arg=$2

    if [[ $time_arg == *:* ]]; then
      hour=${time_arg%%:*}
      min=${time_arg##*:}
    else 
      hour=$time_arg
      min=0
    fi

    countdown "$hour" "$min" &
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
