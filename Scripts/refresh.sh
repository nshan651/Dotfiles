#!bin/sh

# Set up external monitor
# Default monitor: DP-2-2
sleep 2  
external_monitor=$(xrandr --query | grep 'DP-1')
if [[ $external_monitor = *connected* ]]; then
	#xrandr --output DP-2-2 --off && xrandr --output eDP-1 --mode 1920x1080 --rotate normal --output DP-2-2 --primary --mode 1920x1080 --rotate normal --left-of eDP-1 
	xrandr --output DP-1 --off && xrandr --output eDP-1 --mode 1920x1080 --rotate normal --output DP-1 --primary --mode 1920x1080 --rotate normal --left-of eDP-1 
fi

# Reload
/bin/sh ~/.config/polybar/launch.sh --blocks
