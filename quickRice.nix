{lib, options, ...}:
let
  cooleo = {
    scheme = TokyoNight;
  };
  TokyoNight = [
    "15161e"
    "f7768e"
    "9ece6a"
    "e0af68"
    "7aa2f7"
    "bb9af7"
    "7dcfff"
    "a9b1d6"
                            
    "414868"
    "ff899d"
    "9fe044"
    "faba4a"
    "8db0ff"
    "c7a9ff"
    "a4daff"
    "c0caf5"
  ];
in
{
  options = {
    rice = lib.mkOption {default = cooleo;};
    col = {
      scheme = lib.mkOption {default = TokyoNight;};
    };
  };
  config = {
    col = builtins.listToAttrs (builtins.genList(i: {
      name = builtins.elemAt [
        "black1"
        "red1"
        "green1"
        "yellow1"
        "blue1"
        "magenta1"
        "cyan1"
        "white1"
        "black2"
        "red2"
        "green2"
        "yellow2"
        "blue2"
        "magenta2"
        "cyan2"
        "white2"
      ] i;
      value = builtins.elemAt options.col.scheme i;
    })
      (builtins.length options.col.scheme)
    );
  };
}
