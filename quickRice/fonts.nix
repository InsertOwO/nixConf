{pkgs, ...}:

{
  config.rice.font = {
    "CaskaydiaMono Nerd Font".package = pkgs.nerd-fonts.caskaydia-mono;
    "DepartureMono Nerd Font".package = pkgs.nerd-fonts.departure-mono;
  };
}
