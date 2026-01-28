{...}:

{
  # Set screen to go idle after a certain time.
  wayland.windowManager.sway.startup = [
    {command = "workstyle";}
  ];
  
  programs.foot.settings.color.alpha = 0.9;

  imports = [
    ./rofi.nix
    ./waybar.nix
  ];
}
