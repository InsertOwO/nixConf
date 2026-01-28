{config, lib, ...}:
let
  palettes = {
    TokyoNight = [
      "15161e" "f7768e" "9ece6a" "e0af68"
      "7aa2f7" "bb9af7" "7dcfff" "a9b1d6"

      "414868" "ff899d" "9fe044" "faba4a"
      "8db0ff" "c7a9ff" "a4daff" "c0caf5"
    ];
    Pure = [
      "000000" "ff0000" "00ff00" "ffff00"
      "0000ff" "ff00ff" "00ffff" "bfbfbf"

      "404040" "ff8080" "80ff80" "ffff80"
      "8080ff" "ff80ff" "80ffff" "ffffff"
    ];
    GruvBox = [
      "3c3836" "9d0006" "79740e" "b57614"
      "076678" "8f3f71" "427b58" "928374"

      "7c6f64" "cc241d" "98971a" "d79921"
      "458588" "b16286" "689d6a" "f2e5bc"
    ];
  };
in {
  config = {
    col = builtins.listToAttrs (builtins.genList(i: {
      name = builtins.elemAt [
        "black1" "red1" "green1" "yellow1"
        "blue1" "magenta1" "cyan1" "white1"
        "black2" "red2" "green2" "yellow2"
        "blue2" "magenta2" "cyan2" "white2"
      ] i;
      value = builtins.elemAt palettes.${config.palette.name} i;
    })
      (builtins.length palettes.${config.palette.name})
    );
    pal = builtins.listToAttrs (builtins.genList(i: {
      name = builtins.elemAt [
        "pri1" "pri2" "sec1" "sec2" "fg2" "fg1" "bg2" "bg1" 
      ] i;
      value = (config.col.${lib.concatStrings [
        (config.palette.${builtins.elemAt ["pri" "sec" "fg" "bg"] (i / 2)}) (builtins.toString (i / 4 + 1 - (i / 7)))
      ]});
    })
      8
    );

  };
}
