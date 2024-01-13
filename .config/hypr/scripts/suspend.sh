#!/bin/bash
if pacmd list-sink-inputs | grep -q "0 sink input"; then
  systemctl suspend
fi
