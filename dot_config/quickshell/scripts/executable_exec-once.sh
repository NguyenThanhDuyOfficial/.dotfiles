#!/usr/bin/env bash

DIR="$HOME/.config/quickshell/cache"
mkdir -p "$DIR"
DATE_FILE="$DIR/date.txt"

TODAY=$(date +%d)

if [ $TODAY != $(cat $DATE_FILE 2>/dev/null || echo 0) ]; then
  echo $TODAY >"$DATE_FILE"

  # WEATHER
  echo "Weather"
  WEATHER_FILE="$DIR/weather.json"
  curl -s "wttr.in/Ho_Chi_Minh?format=j1" >"${WEATHER_FILE}.tmp"
  mv "${WEATHER_FILE}.tmp" "$WEATHER_FILE"

  # QUOTE
  echo "Quote"
  QUOTE_FILE="$DIR/quote.json"
  curl -s "https://zenquotes.io/api/random" >"${QUOTE_FILE}.tmp"
  mv "${QUOTE_FILE}.tmp" "$QUOTE_FILE"

  echo "Done"
else
  echo "It's the same day!!!"
fi
