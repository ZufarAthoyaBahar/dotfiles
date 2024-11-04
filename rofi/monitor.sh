chosen=$(echo -e "HDMI\nAUTO" | rofi -dmenu -i -p "Monitor" -theme ~/.config/rofi/spotlight-dark.rasi )

case "$chosen" in
    "HDMI") xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --same-as eDP-1 ;;
    "AUTO") xrandr --auto ;;
esac
