#!/bin/bash

ICONS=/usr/share/icons/Papirus-Dark/24x24/symbolic/status/

notify_osd() {
  local icon=$1
  local title=$2
  local body=$3
  local value=$4 # 0-100 for progress bar, empty to skip

  if [ -n "$value" ]; then
    notify-send \
      -h string:x-canonical-private-synchronous:osd \
      -h "int:value:$value" \
      -i "$icon" \
      "$title" "$body"
  else
    notify-send \
      -h string:x-canonical-private-synchronous:osd \
      -i "$icon" \
      "$title" "$body"
  fi
}

case "$1" in
media-playpause)
  playerctl play-pause
  STATUS=$(playerctl status 2>/dev/null)
  TITLE=$(playerctl metadata title 2>/dev/null)
  if [ "$STATUS" = "Playing" ]; then
    notify_osd "$ICONS/media-playback-playing-symbolic.svg" "Now Playing" "$TITLE"
  else
    notify_osd "$ICONS/media-playback-paused-symbolic.svg" "Paused" "$TITLE"
  fi
  ;;

media-next)
  playerctl next
  sleep 0.1
  TITLE=$(playerctl metadata title 2>/dev/null)
  notify_osd "$ICONS/media-skip-forward-symbolic.svg" "Next" "$TITLE"
  ;;

media-prev)
  playerctl previous
  sleep 0.1
  TITLE=$(playerctl metadata title 2>/dev/null)
  notify_osd "$ICONS/media-skip-backward-symbolic.svg" "Previous" "$TITLE"
  ;;
esac
