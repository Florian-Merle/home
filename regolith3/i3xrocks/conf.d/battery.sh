#!/bin/bash
# Battery blocklet for Regolith
# This script was adapted from https://github.com/hastinbe/i3blocks-battery-plus

LABEL_COLOR=${label_color:-$(xrescat i3xrocks.label.color "#7B8394")}
VALUE_FONT=${font:-$(xrescat i3xrocks.value.font "Source Code Pro Medium 13")}
BUTTON=${button:-}

# Get battery status.
#
# Returns:
#   The battery's status or state.
get_battery_status() {
    echo "$__UPOWER_INFO" | awk -W posix '$1 == "state:" {print $2}'
}

# Get battery percentage.
#
# Returns:
#   The battery's percentage, without the %.
get_battery_percent() {
    echo "$__UPOWER_INFO" | awk -W posix '$1 == "percentage:" { gsub("%","",$2); print int($2)}'
}

BATT_DEVICE="DisplayDevice"
__UPOWER_INFO=$(upower --show-info "/org/freedesktop/UPower/devices/${BLOCK_INSTANCE:-$BATT_DEVICE}")


BATT_PERCENT=$(get_battery_percent)
CHARGE_STATE=$(get_battery_status)

if [ -z "$BATT_PERCENT" ]; then
    exit 0
elif [ "$BATT_PERCENT" -ge 0 ] && [ "$BATT_PERCENT" -le 10 ]; then
    VALUE_COLOR=$(xrescat i3xrocks.critical.color red)
elif [ "$BATT_PERCENT" -ge 10 ] && [ "$BATT_PERCENT" -le 20 ]; then
    VALUE_COLOR=$(xrescat i3xrocks.error.color orange)
else
    VALUE_COLOR=$(xrescat i3xrocks.value.color white)
fi

case $((BATT_PERCENT / 10)) in
  0) LABEL_ICON="󰁺" ;;
  1) LABEL_ICON="󰁻" ;;
  2) LABEL_ICON="󰁼" ;;
  3) LABEL_ICON="󰁽" ;;
  4) LABEL_ICON="󰁾" ;;
  5) LABEL_ICON="󰁿" ;;
  6) LABEL_ICON="󰂀" ;;
  7) LABEL_ICON="󰂁" ;;
  8) LABEL_ICON="󰂂" ;;
  9) LABEL_ICON="󰁹" ;;
  10) LABEL_ICON="󰁹" ;;
esac

if [ -z "$CHARGE_STATE" ]; then
    exit 0
elif [ "$CHARGE_STATE" == "discharging" ]; then
    CHARGE_ICON=$(xrescat i3xrocks.label.dn D)
elif [ "$CHARGE_STATE" == "charging" ]; then
    CHARGE_ICON=$(xrescat i3xrocks.label.up C)
else
    CHARGE_ICON=$(echo -e '\u2003')
fi

ICON_SPAN="<span font_desc=\"${VALUE_FONT}\" color=\"${LABEL_COLOR}\">$LABEL_ICON</span>"
VALUE_SPAN="<span font_desc=\"${VALUE_FONT}\" color=\"${VALUE_COLOR}\"> $BATT_PERCENT%</span>"
CHARGE_SPAN="<span color=\"${VALUE_COLOR}\">$CHARGE_ICON</span>"

echo "${ICON_SPAN}${VALUE_SPAN}${CHARGE_SPAN}"

if [[ "x${BUTTON}" == "x1" ]]; then
    ACTION=$(xrescat i3xrocks.action.battery "regolith-control-center power")
    /usr/bin/i3-msg -q exec "$ACTION"
fi

