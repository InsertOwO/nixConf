{config, pkgs, ...}:
let
  fonts = {
    "CaskaydiaMono Nerd Font".pack = pkgs.nerd-fonts.caskaydia-mono;
    "DepartureMono Nerd Font".pack = pkgs.nerd-fonts.departure-mono;
  };
in {
  home.packages = [fonts.${config.font}.pack];
}
