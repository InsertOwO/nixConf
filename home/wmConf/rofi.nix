{pkgs, config, ...}:

{

  programs.rofi = {
    enable = true;
    package = (pkgs.rofi-unwrapped.override {
      x11Support = false;
    });

    modes = [
      "drun"
      "filebrowser"
      "window"
      "powermenu:${builtins.path {path = ./powermenu.sh;}}"
    ];

    font = "${config.font} 14";
  };
}
