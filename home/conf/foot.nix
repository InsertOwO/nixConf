{config, ...}:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "CaskaydiaMono Nerd Font:size=12";
      };

      cursor.style = "underline";

      colors = {
        alpha = 0.9;

        foreground="${config.col.txtCol}";
        background="${config.col.bgCol}";

        regular0="${config.col.black1}";
        regular1="${config.col.red1}";
        regular2="${config.col.green1}";
        regular3="${config.col.yellow1}";
        regular4="${config.col.blue1}";
        regular5="${config.col.magenta1}";
        regular6="${config.col.cyan1}";
        regular7="${config.col.white1}";

        bright0="${config.col.black2}";
        bright1="${config.col.red2}";
        bright2="${config.col.green2}";
        bright3="${config.col.yellow2}";
        bright4="${config.col.blue2}";
        bright5="${config.col.magenta2}";
        bright6="${config.col.cyan2}";
        bright7="${config.col.white2}";

        urls="${config.col.priCol}";
      };
    };
  };
}
