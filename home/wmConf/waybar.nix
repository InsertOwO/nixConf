{config, ...}:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      spacing = 4;
      bar_id = "bar-0";
      ipc = true;

      modules-left = ["custom/os" "sway/workspaces" "sway/mode"];
      modules-center = ["sway/window" "privacy"];
      modules-right = ["group/hardware" "tray" "network" "battery" "wireplumber" "clock"]; 

      "custom/os" = {
        format = " ";
        on-click = "wlogout";
      };
      "sway/workspaces" = {
        format = "{icon}";
      };
      "sway/mode" = {
         format = " ";
      };

      "sway/window" = {
        format = "{title}";
        max-length = 30;
      };
      privacy = {
        icon-size = 16;
        transition-duration = 250;
        modules = [
          {
            type = "screenshare";
            tooltip = true;
            tooltip-icon-size = 24;
          }
          {
            type = "audio-in";
            tooltip = true;
            tooltip-icon-size = 24;
          }
        ];
      };

      "group/hardware" = {
        drawer = {
          click-to-reveal = true;
          transition-left-to-right = false;
        };
        orientation = "horizontal";
        modules = [
          "custom/divider"
          "disk"
          "cpu"
          "memory"
        ];
      };
      "custom/divider" = {
        format = "|";
      };
      disk = {
        interval = 30;
        format = "{specific_used:0.1f}/{specific_total:0.1f}󰋊";
        states."warning" = 85;
        unit = "GB";
      };
      cpu = {
        format = " {}% ";
        states."warning" = 80;
      };
      memory = {
        interval = 30;
        format = " {used:0.1f}G/{total:0.1f}G ";
        states."warning" = 85;
      };

      network = {
        format-wifi = "{signalStrength} ";
        tooltip-format-wifi = "{essid} ({signalStrength}%)";
        format-ethernet = " ";
        tooltip-format-ethernet = "{ifname}";
        format-disconnected = " "; 
        on-click = "foot -a nmtui -e 'nmtui'";
      };
      battery = {
        interval = 60;
        format = "{capacity}{icon}";
        format-icons = [" " " " " " " " " "];
        states."warning" = 15;
      };
      wireplumber = {
        format = "{volume}{icon}";
        format-muted = "";
        format-icons = ["" " " " "];
        on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
        on-click-right = "pwvucontrol";
      };
      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%d/%m/%y}";
      };
    };

    style = ''
      * {
        font-family: CaskaydiaMono Nerd Font;
        font-weight: bold;
        font-size: 15px;
        color:  #${config.col.txtCol};
        background: transparent;
      }

      .modules-left {
        padding-right: 15px;
        background: #${config.col.bgCol};
        border-radius: 0 0 25px 0;
      }

      .modules-center {
        padding-right: 15px;
        padding-left: 15px;
        background: #${config.col.bgCol};
        border-radius: 0 0 25px 25px;
      }

      .modules-right {
        padding-left: 15px;
        background: #${config.col.bgCol};
        border-radius: 0 0 0 25px;
      }

      #custom-os {
        font-size: 24px;
        color: #${config.col.priCol};
      }

      tooltip {
        background: #${config.col.bgCol};
      }

      #tray menu {
        background: #${config.col.bgCol};
      }

      #workspaces button {
        border-style: none none solid;
        border-color: #${config.col.txtCol};
        border-width: 3px;
        border-radius: 0px;
        padding: 0px;
      }

      #workspaces button.focused, #workspaces button.active {
        border-color: #${config.col.priCol};
      }

      #battery.charging {
        color:  #${config.col.cyan1};
      }

      #battery.warning {
        color: #${config.col.red1};
      }

      #network.disconnected {
      	color: #${config.col.red1};
      }
    '';
  };
}
