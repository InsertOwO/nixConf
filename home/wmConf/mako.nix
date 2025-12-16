{config, ...}:

{
  services.mako = {
    enable = true;
    settings = {
      max-visible = 3;
      border-size = 3;
      margin = 5;
      font = "${config.font}";
      text-color = "#${config.col.txtCol}";
      border-color = "#${config.col.secCol}";
      background-color = "#${config.col.bgCol}";
    };
  };
}
