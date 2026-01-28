{config, ...}:
let
  font = config.rice.font;
  palate = config.rice.palate;
in {
  config.rice.theme = {
    "cooleo" = {
      font = font."CaskaydiaMono Nerd Font";
      colors = palate."TokyoNight";
    };
    "retro" = {
      font = font"DepartureMono Nerd Font";
      colors = palate."Pure";
    };
  };
}
