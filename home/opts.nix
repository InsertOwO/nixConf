{osConfig, config, lib, ...}: # Options to be potentially set in home.nix.

{
  options = {

    # Name of the user.
    name =  lib.mkOption {default = "insert";};

    font = lib.mkOption {default = "CaskaydiaMono Nerd Font";};

    # Set colors(Default: Tokyo Night).
    col = {
      black1 = lib.mkOption   {default = "${osConfig.col.black1}"  ;};
      red1 = lib.mkOption     {default = "${osConfig.col.red1}"    ;};
      green1 = lib.mkOption   {default = "${osConfig.col.green1}"  ;};
      yellow1 = lib.mkOption  {default = "${osConfig.col.yellow1}" ;};
      blue1 = lib.mkOption    {default = "${osConfig.col.blue1}"   ;};
      magenta1 = lib.mkOption {default = "${osConfig.col.magenta1}";};
      cyan1 = lib.mkOption    {default = "${osConfig.col.cyan1}"   ;};
      white1 = lib.mkOption   {default = "${osConfig.col.white1}"  ;};
                                                               
      black2 = lib.mkOption   {default = "${osConfig.col.black2}"  ;};
      red2 = lib.mkOption     {default = "${osConfig.col.red2}"    ;};
      green2 = lib.mkOption   {default = "${osConfig.col.green2}"  ;};
      yellow2 = lib.mkOption  {default = "${osConfig.col.yellow2}" ;};
      blue2 = lib.mkOption    {default = "${osConfig.col.blue2}"   ;};
      magenta2 = lib.mkOption {default = "${osConfig.col.magenta2}";};
      cyan2 = lib.mkOption    {default = "${osConfig.col.cyan2}"   ;};
      white2 = lib.mkOption   {default = "${osConfig.col.white2}"  ;};
      
      priCol = lib.mkOption   {default = "${config.col.magenta1}";};
      secCol = lib.mkOption   {default = "${config.col.blue1}";};
      bgCol = lib.mkOption    {default = "${config.col.black1}";};
      txtCol = lib.mkOption   {default = "${config.col.white2}";};
    };
  };

  imports = [
    ./conf/conf.nix
    ./wmConf/wm.nix
  ];
}
