{pkgs, ...}:

pkgs.writeShellScriptBin "zenmode" ''
  if [ $(pidof waybar) ]; then
    pkill swaybg
    pkill waybar
    swaymsg gaps inner all set 0
  else
    swaymsg gaps inner all set 5px
    swaymsg reload
  fi
''
