{lib, ...}:

{
  options = {
    font = lib.mkOption {type = lib.types.str; default = "CaskaydiaMono Nerd Font";};
    col = lib.mkOption {type = lib.types.attrsOf lib.types.str;};
    palette = {
      name = lib.mkOption {type = lib.types.str; default = "TokyoNight";};
      pri = lib.mkOption {default = "magenta";};
      sec = lib.mkOption {default = "blue";};
      bg = lib.mkOption {default = "black";};
      fg = lib.mkOption {default = "white";};
    };
    pal = lib.mkOption {type = lib.types.attrsOf lib.types.str;};
  };

  imports = [
    ./conf/conf.nix
    ./wmConf/wm.nix

    ./themes/fonts.nix
    ./themes/palates.nix
  ];
}
