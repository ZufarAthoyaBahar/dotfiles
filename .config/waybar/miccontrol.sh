#!/bin/bash
#
# Copyright © 2020 Filip Paskali
#
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

# SOURCE=$(pactl list short sources | grep -m 1 input | awk '{print $1}')
SOURCE=$(pactl list short sources | grep "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Mic1__source" | awk '{print $1}')

# Check if SOURCE is empty
if [ -z "$SOURCE" ]; then
    echo "No microphone source found"
    exit 1
fi

# Set the microphone mute/unmute based on the block button (left or right click)
case $BLOCK_BUTTON in
    1|3) pactl set-source-mute $SOURCE toggle ;;
esac

# Get the mute status of the microphone
MUTE_STATUS=$(pactl get-source-mute $SOURCE | awk '{print $2}')

# Display the appropriate icon based on the mute status
if [ "$MUTE_STATUS" = "yes" ]; then
    color="#707880"
    icon=" "  # Muted icon
else
    color="#F0C674"
    icon=""  # Unmuted icon
fi

# Print the icon and the mute status
echo "$icon"
