{config, pkgs, ...}: # Home configuration for swayLock.

 let
  # Lock and display commands.
  lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
  display = state: "${pkgs.sway}/bin/swaymsg 'output * power ${state}'";
in

{
  services.swayidle = {
#    enable = true;
    timeouts = [
      {
        timeout = 25;
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
      }
      {
        timeout = 30;
        command = display "off";
        resumeCommand = display "on";
      }
      # Leave time to resume quickly before really locking.
      {
        timeout = 35;
        command = ("${pkgs.systemd}/bin/systemctl suspend") + "; " + lock;
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = lock;
      }
      {
        event = "after-resume";
        command = display "on";
      }
      {
        event = "lock";
        command = (display "off") + "; " + lock;
      }
      {
        event = "unlock";
        command = display "on";
      }
    ];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      image = "~/.local/bg.png";
      scaling = "fill";
      font = "CaskaydiaMono Nerd Font";
      line-uses-ring = true;

      text-color = "${config.col.txtCol}";
      layout-text-color = "${config.col.txtCol}";
      layout-bg-color = "${config.col.bgCol}";

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
