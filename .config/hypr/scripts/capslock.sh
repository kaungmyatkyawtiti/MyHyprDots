#!/bin/bash

# Path to Papirus dark icons (adjust if needed)
ICON_ON="/usr/share/icons/breeze-dark/devices/24/keyboard-caps-enabled.svg"
ICON_OFF="/usr/share/icons/breeze-dark/devices/24/keyboard-caps-disabled.svg"

# Dynamically query all Caps Lock LEDs to circumvent the dynamic 'inputX' variation
caps_state=$(cat /sys/class/leds/*::capslock/brightness | sort -r | head -n 1 2>/dev/null || echo "0")

if [ "$caps_state" = "1" ]; then
  dunstify -u low -t 2000 -i "$ICON_ON" \
    "Caps Lock" "ON" \
    -h string:x-dunst-stack-tag:capslock
else
  dunstify -u low -t 2000 -i "$ICON_OFF" \
    "Caps Lock" "OFF" \
    -h string:x-dunst-stack-tag:capslock
fi
