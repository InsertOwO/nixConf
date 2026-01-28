{config, ...}: # Home configuration for swayLock.

{
  programs.swaylock = {
    enable = true;
    settings = {
      image = "~/.local/bg.png";
      scaling = "fill";
      font = "${config.font}";
      line-uses-ring = true;

      text-color = "${config.pal.fg1}";
      layout-text-color = "${config.pal.fg1}";
      layout-bg-color = "${config.pal.bg1}";

      key-hl-color = "${config.col.green1}";
      separator-color = "${config.col.green1}";
      inside-color = "${config.col.black2}";
      ring-color = "${config.col.black1}";

      bs-hl-color = "${config.col.red1}";
      inside-wrong-color = "${config.col.red1}";
      ring-wrong-color = "${config.col.red2}";

      inside-ver-color = "${config.col.blue1}";
      ring-ver-color = "${config.col.blue2}";

      inside-clear-color = "${config.col.yellow1}";
      ring-clear-color = "${config.col.yellow2}";
    };
  };
}
