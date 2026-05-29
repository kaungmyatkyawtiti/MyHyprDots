#!/bin/bash

# Fixed: Removed the leading space that was breaking the icon path
ICON_DIR="/usr/share/icons/breeze-dark/status/24"

# --- Helper Functions ---

get_volume() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

is_muted() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
}

# --- Notification Function ---

send_audio_notification() {
  if is_muted; then
    dunstify -h string:x-dunst-stack-tag:audio_notif \
      -i "$ICON_DIR/audio-volume-muted.svg" \
      "Volume" "Muted"
  else
    local vol=$(get_volume)
    local icon="audio-volume-low.svg"

    if [ "$vol" -gt 60 ]; then
      icon="audio-volume-high.svg"
    elif [ "$vol" -gt 25 ]; then
      icon="audio-volume-medium.svg"
    fi

    dunstify -h string:x-dunst-stack-tag:audio_notif \
      -h int:value:"$vol" \
      -i "$ICON_DIR/$icon" \
      "Volume: $vol%"
  fi
}

# --- Core Logic ---

case $1 in
up)
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
  send_audio_notification
  ;;
down)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  send_audio_notification
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  send_audio_notification
  ;;
*)
  echo "Usage: $0 {up|down|mute}"
  exit 1
  ;;
esac
