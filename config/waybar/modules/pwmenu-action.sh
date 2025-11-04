#!/bin/bash

# Usa wofi, rofi o tu launcher preferido
option=$(echo -e "🔒 Block\n🌙 Suspend\n🔄 Reboot\n⏻  Poweroff" | wofi --dmenu --prompt "Energía:")

case $option in
"🔒 Block")
  hyprlock # o tu bloqueador preferido
  ;;
"🌙 Suspend")
  systemctl suspend
  ;;
"🔄 Reboot")
  systemctl reboot
  ;;
"⏻ Poweroff")
  poweroff
  ;;
esac
