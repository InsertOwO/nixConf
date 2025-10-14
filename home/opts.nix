{config, lib, ...}: # Options to be potentially set in home.nix.

{
  options = {

    # Name of the user.
    name =  lib.mkOption {default = "insert";};

    # Set colors(Default: Tokyo Night).
    col = {
      black1 = lib.mkOption   {default = "15161e";};
      red1 = lib.mkOption     {default = "f7768e";};
      green1 = lib.mkOption   {default = "9ece6a";};
      yellow1 = lib.mkOption  {default = "e0af68";};
      blue1 = lib.mkOption    {default = "7aa2f7";};
      magenta1 = lib.mkOption {default = "bb9af7";};
      cyan1 = lib.mkOption    {default = "7dcfff";};
      white1 = lib.mkOption   {default = "a9b1d6";};
                                          
      black2 = lib.mkOption   {default = "414868";};
      red2 = lib.mkOption     {default = "ff899d";};
      green2 = lib.mkOption   {default = "9fe044";};
      yellow2 = lib.mkOption  {default = "faba4a";};
      blue2 = lib.mkOption    {default = "8db0ff";};
      magenta2 = lib.mkOption {default = "c7a9ff";};
      cyan2 = lib.mkOption    {default = "a4daff";};
      white2 = lib.mkOption   {default = "c0caf5";};
      
      priCol = lib.mkOption   {default = "${config.col.magenta1}";};
      secCol = lib.mkOption   {default = "${config.col.blue1}";};
      bgCol = lib.mkOption    {default = "1a1b26";};
      txtCol = lib.mkOption   {default = "${config.col.white2}";};
    };
  };

  imports = [
    ./conf/conf.nix
    ./wmConf/wm.nix
  ];
}
