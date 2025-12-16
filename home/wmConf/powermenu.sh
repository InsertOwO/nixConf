#!/usr/bin/env bash

OPTIONS=("Logout" "Suspend" "Reboot" "Shutdown")
ICONS=('' '' '' '')

case x"$@" in
  x" Logout")
    loginctl terminate-user $USER
    ;;
  x" Suspend")
    systemctl suspend; swaylock --daemonize
    exit 0
    ;;
  x" Reboot")
    systemctl reboot
    ;;
  x" Shutdown")
    systemctl poweroff
    ;;
esac

for i in "${!OPTIONS[@]}"; do
  echo "${ICONS[$i]} ${OPTIONS[$i]}"
done
