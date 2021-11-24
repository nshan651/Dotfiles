#!bin/sh

# Set up external monitor
sleep 2  
external_monitor=$(xrandr --query | grep 'DP-2-2')
if [[ $external_monitor = *connected* ]]; then
	xrandr --output DP-2-2 --off && xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output DP-2-2 --mode 1920x1080 --rotate normal --right-of eDP-1 
fi

# Reload
/bin/sh ~/.config/polybar/launch.sh
