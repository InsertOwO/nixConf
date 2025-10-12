{pkgs, ...}:

{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
     })
    prismlauncher
    dsda-doom
    gzdoom

    protonup
  ];
 
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
