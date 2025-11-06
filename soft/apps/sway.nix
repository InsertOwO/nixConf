{pkgs, ...}: # Enable swayWM.

{
  # Sway.
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      # Screenshot script.
      (import ../../home/wmConf/screenshot.nix {inherit pkgs;})

      # Zenmode script.
      (import ../../home/wmConf/zenMode.nix {inherit pkgs;})

      # Temporary, will become a rofi thingy later.
      wlogout

      # Dynamically rename workspaces.
      workstyle
      
      # For adjusting brightness.
      brightnessctl

      wofi
    ];
  };

  # XDG stuff
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Prevent XWayland apps from being blurry.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  imports = [
    ./desk.nix
    ./font.nix
  ];
}
