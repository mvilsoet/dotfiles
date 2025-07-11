#!/bin/bash
chosen=$(echo -e "Shutdown\nReboot\nSuspend\nCancel" | rofi -dmenu -p "Power:")
case $chosen in
  Shutdown) systemctl poweroff ;;
  Reboot)   systemctl reboot ;;
  Suspend)  systemctl suspend ;;
esac

