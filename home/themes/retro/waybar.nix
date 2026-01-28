{config, ...}:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      spacing = 4;
      bar_id = "bar-0";
      ipc = true;

      modules-left = ["group/start" "sway/workspaces" "sway/mode"];
      modules-right = ["group/hardware" "group/sillies"]; 

      "group/start" = {
        orientation = "horizontal";
        modules = [
          "custom/os"
          "sway/window"
        ];
      };
      "custom/os" = {
        format = " ";
        on-click = "rofi -show powermenu";
      };
      "sway/window" = {
        format = "{app_id}";
        max-length = 12;
      };

      "sway/workspaces" = {
        disable-markup = true;
        disable-click = true;
        format = "{name}: {icon}";
        format-icons = {
          default = "□";
          focused = "▣";
        };
      };

      "sway/mode" = {
         format = "| Resize";
      };

      "group/hardware" = {
        orientation = "horizontal";
        modules = [
          "disk"
          "cpu"
          "memory"
        ];
      };
      disk = {
        interval = 30;
        format = "{specific_used:0.1f}/{specific_total:0.1f}M ";
        states."warning" = 85;
        unit = "GB";
      };
      cpu = {
        format = "{}%C ";
        states."warning" = 80;
      };
      memory = {
        interval = 30;
        format = "{used:0.1f}/{total:0.1f}R";
        states."warning" = 85;
      };

      "group/sillies" = {
        orientation = "horizontal";
        modules = [
          "tray"
          "network" 
          "battery" 
          "wireplumber" 
          "clock"
        ];
      };
      network = {
        format-wifi = "{signalStrength}󰢾 ";
        tooltip-format-wifi = "{essid} ({signalStrength}%)";
        format-ethernet = " ";
        tooltip-format-ethernet = "{ifname}";
        format-disconnected = " "; 
        on-click = "foot -a nmtui -e 'nmtui'";
      };
      battery = {
        interval = 60;
        format = "{capacity}{icon} ";
        format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
        states."warning" = 15;
      };
      wireplumber = {
        format = "{volume}{icon}";
        format-muted = "󰖁 ";
        format-icons = ["󰕿 " "󰖀 " "󰕾 "];
        on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
        on-click-right = "pwvucontrol";
      };
      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%d/%m/%y}";
      };
    };
    style = ''
      window#waybar {
        font-family: ${config.font};
        font-size: 14px;
        color:  #${config.pal.fg1};
        background-color: #${config.pal.bg1};
      }

      #start {
        border: solid 3px;
        border-color: #${config.col.white1} #${config.col.black2}
          #${config.col.black2} #${config.col.white1};
        background-color: shade(#${config.pal.bg1}, 0.9);
        margin: 3px;
        padding-left: 2px;
        padding-right: 2px;
      }
      #custom-os {
        font-size: 20px;
        color: #${config.pal.pri1};
      }
      #window {
        font-weight: bolder;
      }

      #workspaces button {
        margin: 3px;
        background-color: #${config.pal.bg1};
        border-style: none none none none;
        box-shadow: none;
      }

      #hardware {
        color:  #${config.col.green1};
        background-color: #${config.col.black1};
        border: solid 3px;
        border-color: #${config.col.black2} #${config.col.white1}
          #${config.col.white1} #${config.col.black2};
        margin: 3px
      }

      #sillies {
        background-color: shade(#${config.pal.bg1}, 0.75);
        margin: 5px 3px 5px 3px;
        padding-left: 2px;
        padding-right: 2px;
      }

      #network.disconnected {
        color: #${config.col.red1};
      }

      #battery.charging, #battery.plugged {
        color:  #${config.col.cyan1};
      }

      #battery.warning:not(.charging) {
        color: #${config.col.red1};
      }
    '';
  };
}
