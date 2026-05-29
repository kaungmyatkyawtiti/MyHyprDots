#!/bin/bash

ICON_DIR="/usr/share/icons/breeze-dark/actions/24/"

# --- Helper Function ---

get_brightness() {
  local max=$(brightnessctl max)
  local cur=$(brightnessctl get)
  echo $((cur * 100 / max))
}

# --- Notification Function ---

send_brightness_notification() {
  local bright=$(get_brightness)

  local icon

  if [ "$bright" -gt 50 ]; then
    icon="brightness-high.svg"
  else
    icon="brightness-low.svg"
  fi

  dunstify -h string:x-dunst-stack-tag:bright_notif \
    -h int:value:"$bright" \
    -i "$ICON_DIR/$icon" \
    "Brightness: $bright%"
}

# --- Core Logic ---

case $1 in
brightup)
  brightnessctl set 10%+
  send_brightness_notification
  ;;
brightdown)
  # Allow going down to 0% (true minimum is 1, but we handle it gracefully)
  brightnessctl set 10%- || brightnessctl set 0
  send_brightness_notification
  ;;
*)
  echo "Usage: $0 {brightup|brightdown}"
  exit 1
  ;;
esac
