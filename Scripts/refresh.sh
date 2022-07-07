#!bin/bash

# Set up external monitor
# Default monitor: DP-2-2
sleep 2  
external_monitor=$(xrandr --query | grep 'DP-2-2')
third_monitor=$(xrandr --query | grep 'DP-2-1')
if [[ $external_monitor = *connected* ]]; then
	xrandr --output DP-2-2 --off && xrandr --output eDP-1 --mode 1920x1080 --rotate normal --output DP-2-2 --primary --mode 1920x1080 --rotate normal --left-of eDP-1 
elif [[ $external_monitor = *connected* && $third_monitor = *connected* ]]; then
	echo "YES"
	xrandr --output DP-2-2 --off --output DP-2-1 --off && xrandr --output eDP-1 --auto --primary --mode 1920x1080 --rotate normal --output DP-2-2 --auto --mode 1920x1080 --rotate normal --right-of eDP-1 --output DP-2-1 --auto --mode 1920x1080 --rotate normal --right-of DP-2-2
fi

# Reload
/bin/sh ~/.config/polybar/launch.sh --blocks
