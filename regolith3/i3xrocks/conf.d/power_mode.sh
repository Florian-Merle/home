#!/bin/bash

LABEL_COLOR=${label_color:-$(xrescat i3xrocks.label.color "#7B8394")}
VALUE_FONT=${font:-$(xrescat i3xrocks.value.font "Source Code Pro Medium 13")}
BUTTON=${button:-}

# Get power mode.
get_power_mode() {
    powerprofilesctl get
}

POWER_MODE=$(get_power_mode)

if [ "$POWER_MODE" == "performance" ]; then
    POWER_MODE_ICON="󱐋"
elif [ "$POWER_MODE" == "balanced" ]; then
    POWER_MODE_ICON="󰾅"
elif [ "$POWER_MODE" == "power-saver" ]; then
    POWER_MODE_ICON="󰌪"
else
    POWER_MODE_ICON=" "
fi

POWER_MODE_SPAN="<span font_desc=\"${VALUE_FONT}\" color=\"${LABEL_COLOR}\">$POWER_MODE_ICON</span>"

echo "${POWER_MODE_SPAN}"
