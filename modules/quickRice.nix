{lib, config, options, ...}:
let
  cooleo = {
    scheme = "TokyoNight";
  };
in
{
  options = {
    rice = lib.mkOption {default = cooleo;};
    col = {
      scheme = lib.mkOption {default = "${options.rice.scheme}";};

      pri = lib.mkOption {default = "${config.col.magenta1}";};
      sec = lib.mkOption {default = "${config.col.blue1}";};
      bg =  lib.mkOption {default = "${config.col.black1}";};
      txt = lib.mkOption {default = "${config.col.white2}";};
    };
  };
  config = {
    col = if "${options.col.scheme}" == "TokyoNight" then {
      black1 =   "15161e";
      red1 =     "f7768e";
      green1 =   "9ece6a";
      yellow1 =  "e0af68";
      blue1 =    "7aa2f7";
      magenta1 = "bb9af7";
      cyan1 =    "7dcfff";
      white1 =   "a9b1d6";
                                          
      black2 =   "414868";
      red2 =     "ff899d";
      green2 =   "9fe044";
      yellow2 =  "faba4a";
      blue2 =    "8db0ff";
      magenta2 = "c7a9ff";
      cyan2 =    "a4daff";
      white2 =   "c0caf5";
    }
    else if "${options.col.scheme}" == "Catppuccin" then {
      black1 =   "494d64";
      red1 =     "ed8796";
      green1 =   "a6da95";
      yellow1 =  "eed49f";
      blue1 =    "8aadf4";
      magenta1 = "f5bde6";
      cyan1 =    "8bd5ca";
      white1 =   "b8c0e0";
                          
      black2 =   "5b6078";
      red2 =     "ed8796";
      green2 =   "a6da95";
      yellow2 =  "eed49f";
      blue2 =    "8aadf4";
      magenta2 = "f5bde6";
      cyan2 =    "8bd5ca";
      white2 =   "a5adcb";
    }
    else {
      black1 =   "494d64";
      red1 =     "ed8796";
      green1 =   "a6da95";
      yellow1 =  "eed49f";
      blue1 =    "8aadf4";
      magenta1 = "f5bde6";
      cyan1 =    "8bd5ca";
      white1 =   "b8c0e0";
                          
      black2 =   "5b6078";
      red2 =     "ed8796";
      green2 =   "a6da95";
      yellow2 =  "eed49f";
      blue2 =    "8aadf4";
      magenta2 = "f5bde6";
      cyan2 =    "8bd5ca";
      white2 =   "a5adcb";
    };
  };
}
