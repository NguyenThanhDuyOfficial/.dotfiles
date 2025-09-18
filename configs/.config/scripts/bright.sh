#!/usr/bin/bash


print_help() {
cat <<EOF
Usage: ${0##*/} [OPTIONS]

Options:
  -i          Initialize brightness variables
  -s up|down  Adjust brightness (increase or decrease)
  -h          Show this help message and exit

Examples:
  ${0##*/} -s up
  ${0##*/} -s down
EOF
}


init() {
  update
}

update() {
  eww update bright=$(brillo | awk -F. '{printf $1}')
}


increase() {
  brillo -q -A 3%
  update
}


decrease() {
  brillo -q -U 3%
  update
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
