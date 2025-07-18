#!/bin/bash
chosen=$(echo -e "Shutdown\nReboot\nLock\nCancel" | rofi -dmenu -p "Power:")
case $chosen in
  Shutdown) systemctl poweroff ;;
  Reboot)   systemctl reboot ;;
  Lock)     ~/.config/i3/scripts/lock.sh ;;
esac

