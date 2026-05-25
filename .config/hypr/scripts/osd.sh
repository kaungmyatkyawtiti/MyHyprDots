#!/bin/bash

ICON_DIR="/usr/share/icons/Papirus-Dark/48x48/status"

# --- Helper Functions ---

get_volume() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

is_muted() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
}

get_mic_muted() {
  wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"
}

get_brightness() {
  # Calculates current brightness percentage using brightnessctl
  local max=$(brightnessctl max)
  local cur=$(brightnessctl get)
  echo $((cur * 100 / max))
}

# --- Notification Dispatcher ---

send_notification() {
  local type=$1

  case $type in
  audio)
    if is_muted; then
      dunstify -h string:x-dunst-stack-tag:audio_notif \
        -i "$ICON_DIR/notification-audio-volume-muted.svg" \
        "Volume" "Muted"
    else
      local vol=$(get_volume)
      local icon="notification-audio-volume-low.svg"

      if [ "$vol" -gt 60 ]; then
        icon="notification-audio-volume-high.svg"
      elif [ "$vol" -gt 25 ]; then
        icon="notification-audio-volume-medium.svg"
      fi

      dunstify -h string:x-dunst-stack-tag:audio_notif \
        -h int:value:"$vol" \
        -i "$ICON_DIR/$icon" \
        "Volume: $vol%"
    fi
    ;;

  mic)
    if get_mic_muted; then
      dunstify -h string:x-dunst-stack-tag:mic_notif \
        -i "$ICON_DIR/notification-microphone-sensitivity-muted.svg" \
        "Microphone" "Muted"
    else
      dunstify -h string:x-dunst-stack-tag:mic_notif \
        -i "$ICON_DIR/notification-microphone-sensitivity-high.svg" \
        "Microphone" "Active"
    fi
    ;;

  brightness)
    local bright=$(get_brightness)
    local icon="notification-display-brightness-low.svg"

    if [ "$bright" -gt 70 ]; then
      icon="notification-display-brightness-full.svg"
    elif [ "$bright" -gt 40 ]; then
      icon="notification-display-brightness-medium.svg"
    elif [ "$bright" -gt 15 ]; then
      icon="notification-display-brightness-high.svg" # Papirus maps high below full
    fi

    dunstify -h string:x-dunst-stack-tag:bright_notif \
      -h int:value:"$bright" \
      -i "$ICON_DIR/$icon" \
      "Brightness: $bright%"
    ;;
  esac
}

# --- Core Logic Triggers ---

case $1 in
up)
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
  send_notification "audio"
  ;;
down)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  send_notification "audio"
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  send_notification "audio"
  ;;
micmute)
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
  send_notification "mic"
  ;;
brightup)
  brightnessctl -n2 set 10%+
  send_notification "brightness"
  ;;
brightdown)
  brightnessctl -n2 set 10%-
  send_notification "brightness"
  ;;
esac
