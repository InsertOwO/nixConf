{config, ...}:

{
  services.mako = {
    enable = true;
    settings = {
      max-visible = 3;
      border-size = 3;
      margin = 5;
      font = "${config.font}";
      text-color = "#${config.pal.fg1}";
      border-color = "#${config.pal.sec1}";
      background-color = "#${config.pal.bg1}";
    };
  };
}
