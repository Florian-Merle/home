#!/usr/bin/env bash

bat=$(ls /sys/class/power_supply/ | grep BAT | head -n1)

capacity=$(cat /sys/class/power_supply/$bat/capacity)
status=$(cat /sys/class/power_supply/$bat/status)

case $((capacity / 10)) in
  0) icon="󰁺" ;;
  1) icon="󰁻" ;;
  2) icon="󰁼" ;;
  3) icon="󰁽" ;;
  4) icon="󰁾" ;;
  5) icon="󰁿" ;;
  6) icon="󰂀" ;;
  7) icon="󰂁" ;;
  8) icon="󰂂" ;;
  9) icon="󰁹" ;;
  10) icon="󰁹" ;;
esac

case "$status" in
  Charging) dir="↑" ;;
  *) arrow="" ;;
esac

# using kargs for trimming
echo "$icon $capacity% $dir" | xargs
