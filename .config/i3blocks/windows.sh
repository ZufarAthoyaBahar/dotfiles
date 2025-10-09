#!/bin/bash

# echo "Running windows.sh" >> wmctrl -l | awk '{for (i=4; i<=NF; i++) printf $i " "; print ""}'
# Menampilkan daftar jendela yang sedang terbuka
# Memfilter output untuk menampilkan nama jendela yang sedang aktif
# wmctrl -l | grep "$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')" | awk '{for (i=4; i<=NF; i++) printf $i " "; print ""}'
i3-msg -t get_tree | jq -r '.. | objects | select(.focused==true) | .name' | awk '{print substr($0, 1, 50)}'

# i3-msg -t get_tree | jq -r '.. | objects | select(.focused==true) | .name'
