#!/bin/bash
# Copyright (C) 2014 Alexander Keller <github@nycroth.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#------------------------------------------------------------------------
if [[ -z "$INTERFACE" ]] ; then
    INTERFACE="${BLOCK_INSTANCE:-wlan0}"
fi
#------------------------------------------------------------------------

COLOR_GE80=${COLOR_GE80:-#00FF00}
COLOR_GE60=${COLOR_GE60:-#FFF600}
COLOR_GE40=${COLOR_GE40:-#FFAE00}
COLOR_LOWR=${COLOR_LOWR:-#FF0000}
COLOR_DOWN=${COLOR_DOWN:-#FF0000}

# Check if the wireless interface exists
[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] && exit

# Check if the interface is down
if [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]]; then
    echo "down"
    echo "down"
    echo $COLOR_DOWN
    exit
fi

# Get the signal quality
QUALITY=$(iw dev ${INTERFACE} link | grep 'dBm$' | grep -Eoe '-[0-9]{2}' | awk '{print  ($1 > -50 ? 100 :($1 < -100 ? 0 : ($1+100)*2))}')

# Get the SSID of the connected network
SSID=$(iwgetid -r)

# symbol for wifi
if [[ $QUALITY -ge 80 ]]; then
    icon="󰤨"
    color=$COLOR_GE80
elif [[ $QUALITY -ge 60 ]]; then
    icon="󰤥"
    color=$COLOR_GE60
elif [[ $QUALITY -ge 40 ]]; then
    icon="󰤢"
    color=$COLOR_GE40
else
    icon="󰤟"
    color=$COLOR_LOWR
fi

# Output the SSID and signal quality
echo "$icon $SSID $QUALITY%"  # full text
echo "$icon $SSID $QUALITY%"  # short text

# color based on signal quality
if [[ $QUALITY -ge 80 ]]; then
    echo "$COLOR_GE80 $icon"
elif [[ $QUALITY -ge 60 ]]; then
    echo "$COLOR_GE60 $icon"
elif [[ $QUALITY -ge 40 ]]; then
    echo "$COLOR_GE40"
else
    echo "$COLOR_LOWR"
fi
