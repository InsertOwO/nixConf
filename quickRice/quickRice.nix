{lib, config, options, ...}:
let
  theme = config.rice.theme.${options.rice.theme};
in {
  options = {
    rice = {
      theme = lib.mkOption {default = "retro";};
      font = lib.mkOption {type = lib.types.str;};
      palate = lib.mkOption {type = lib.types.listOf lib.types.str;};
      colors = lib.mkOption {type = lib.types.attrsOf lib.types.str;};
      
    };
  };

  config.rice = {
    font = lib.mkDefault theme.font;
    palate = lib.mkDefault theme.colors;
    colors = builtins.listToAttrs (builtins.genList(i: {
      name = builtins.elemAt [
        "black1" "red1" "green1" "yellow1"
        "blue1" "magenta1" "cyan1" "white1"
        "black2" "red2" "green2" "yellow2"
        "blue2" "magenta2" "cyan2" "white2"
      ] i;
      value = builtins.elemAt config.${theme}.palate i;
    })
      (builtins.length config.${theme}.palate)
    );
  };
  imports = [
    ./fonts.nix
    ./themes.nix
    ./palates.nix
  ];
}
