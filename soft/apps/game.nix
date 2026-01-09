{lib, config, pkgs, ...}:

{
  programs = {
    gamescope = {
      enable = true;
    };
    steam = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
     })
    prismlauncher

    r2modman

    freetube
    dsda-doom
    gzdoom
    (osu-lazer-bin.override {
      nativeWayland = true;
     })

    pcsx2
    vkquake
    protonup-ng
  ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
