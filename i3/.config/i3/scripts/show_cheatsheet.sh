#!/bin/bash
column -t -s $'\t' ~/.config/i3/cheatsheet.txt | rofi -dmenu -p "i3wm Cheatsheet" -lines 15 -columns 2 -width 80 -hide-scrollbar
