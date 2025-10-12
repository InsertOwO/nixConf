{config, ...}: # Home configuration for swayLock.

{
  services.swayidle = {
    enable = true;
    timeouts = [{
      timeout = 300; command = "swaylock";
    }];
    events = [{
      event = "before-sleep"; command = "swaylock";
    }];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      image = "~/.local/wallpaper.png";
      scaling = "fill";
      font = "CaskaydiaMono Nerd Font";
      line-use-ring = true;

      text-color = "${config.col.txtCol}";

      key-hl-color = "${config.col.blue1}";
      inside-color = "${config.col.magenta2}";
      ring-color = "${config.col.magenta1}";

      bs-hl-color = "${config.col.red1}";
      inside-wrong-color = "${config.col.red2}";
      ring-wrong-color = "${config.col.red1}";

      inside-ver-color = "${config.col.blue2}";
      ring-ver-color = "${config.col.blue1}";
    };
  };
}
