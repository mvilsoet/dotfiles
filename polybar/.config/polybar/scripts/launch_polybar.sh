#!/bin/bash
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch on all monitors detected by Polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done
