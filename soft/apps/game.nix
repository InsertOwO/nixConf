{pkgs, ...}:

{
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
      ];
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
     })
    prismlauncher
    dsda-doom
    gzdoom

    r2modman
    pcsx2
    protonup
  ];
 
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
