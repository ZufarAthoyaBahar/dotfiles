uptime=$(uptime -p | sed -e 's/up //g')
chosen=$(echo -e "  Lock\n󰍃  Logout\n󰐥  Shutdown\n  Reboot\n󰒲  Suspend\n󰖔  Hibernate" | rofi -dmenu -i -mesg "Uptime: $uptime" -theme ~/.config/rofi/spotlight-dark.rasi )

case "$chosen" in
    "  Lock") betterlockscreen -l dim;;
    "󰍃  Logout") i3-msg exit ;;
    "󰐥  Shutdown") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
    "󰒲  Suspend") betterlockscreen -s dim --off 10 ;;
    "󰖔  Hibernate") betterlockscreen -l dim --off 10 && systemctl hibernate ;;
esac
