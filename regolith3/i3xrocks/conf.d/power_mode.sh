#!/bin/bash

LABEL_COLOR=${label_color:-$(xrescat i3xrocks.label.color "#7B8394")}
VALUE_FONT=${font:-$(xrescat i3xrocks.value.font "Source Code Pro Medium 13")}
BUTTON=${button:-}

# Cycle to the next power mode on click
if [ "$BUTTON" == "1" ]; then
    case "$(powerprofilesctl get)" in
        performance) powerprofilesctl set balanced ;;
        balanced) powerprofilesctl set power-saver ;;
        power-saver) powerprofilesctl set performance ;;
    esac
fi

POWER_MODE=$(powerprofilesctl get)

if [ "$POWER_MODE" == "performance" ]; then
    POWER_MODE_ICON=""
elif [ "$POWER_MODE" == "balanced" ]; then
    POWER_MODE_ICON="󰾅"
elif [ "$POWER_MODE" == "power-saver" ]; then
    POWER_MODE_ICON="󰌪"
else
    POWER_MODE_ICON=" "
fi

POWER_MODE_SPAN="<span font_desc=\"${VALUE_FONT}\" color=\"${LABEL_COLOR}\">$POWER_MODE_ICON</span>"

echo "${POWER_MODE_SPAN}"
