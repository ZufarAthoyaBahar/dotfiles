uptime=$(uptime -p | sed -e 's/up //g')
chosen=$(echo -e "  Lock\n󰍃  Logout\n󰐥  Shutdown\n  Reboot\n󰒲  Suspend\n󰖔  Hibernate" | rofi -dmenu -i -mesg "Uptime: $uptime" -theme ~/.config/rofi/spotlight-dark.rasi )

case "$chosen" in
    "  Lock") hyprlock ;;
    "󰍃  Logout") hyprctl dispatch exit ;;
    "󰐥  Shutdown") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
    "󰒲  Suspend") systemctl suspend && hyprlock ;;
esac
