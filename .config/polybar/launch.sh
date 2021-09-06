#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar eDP-1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar DP-1-2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."

