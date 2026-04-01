#!/bin/bash

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

echo "${POWER_MODE_ICON}"
