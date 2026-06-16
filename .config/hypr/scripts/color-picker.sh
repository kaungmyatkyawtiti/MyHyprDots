#!/bin/bash

# Pick color, copy to clipboard, notify via dunst

COLOR=$(hyprpicker --autocopy)

# Exit silently if user cancelled (empty output)
[[ -z "$COLOR" ]] && exit 0

notify-send \
  "Color picked" \
  "$COLOR" \
  --icon=/usr/share/icons/Papirus-Dark/24x24/actions/color-picker.svg \
  --urgency=normal \
  --hint=string:value:$COLOR
