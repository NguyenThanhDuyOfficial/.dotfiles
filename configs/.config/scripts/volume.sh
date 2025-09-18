#!/usr/bin/bash


init() {
  read vol isVolMute <<< "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d %s", $2*100, ($3=="[MUTED]"?"true":"false") }')"

  eww update vol=$vol
  eww update isVolMute=$isVolMute
}


update() {
  eww update vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d", $2*100}')
}


increase() {
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
  update
}


decrease() {
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  update
}


print_help() {
cat <<EOF
Usage: ${0##*/} [OPTIONS]

Options:
  -i          Initialize volume variables
  -s up|down  Adjust volume (increase or decrease)
  -h          Show this help message and exit

Examples:
  ${0##*/} -s up
  ${0##*/} -s down
EOF
}


# main
if [[ $# -eq 0 ]]; then
  echo "ERROR: no options provided."
  print_help
  exit 1
fi

while getopts "his:" opt; do
  case $opt in
    i) init ;;
    s)
      case $OPTARG in
        up) increase ;;
        down) decrease ;;
      esac
    ;;
    h|*|--) print_help
    ;;
  esac
done
