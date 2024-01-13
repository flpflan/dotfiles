#!/bin/bash
if pacmd list-sink-inputs | grep -q "0 sink input"; then
  swaylock -f -i "$(find ~/Pictures/lockscreens -type f|shuf -n 1)" -C ~/.config/swaylock/config
fi
