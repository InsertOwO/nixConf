{...}:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        color = "blue";
        separator = "  ";
        size.binaryPrefix = "jedec";
      };
      logo = {
        source = ./colonThree;
        color."1" = "magenta";
        padding = {
          right = 4;
          left = 1;
          top = 1;
        };
      };
      modules = [
        {
          type = "title";
          format = " {user-name-colored}@{host-name-colored}";
        }

        "break"

        {
          type = "os";
          key = "OS 󰢻";
          format = "{pretty-name}";
        }
        {
          type = "uptime";
          key = " ├Uptime ";
        }
        {
          type = "packages";
          key = " ├Pkgs 󰆧";
          format = "{nix-all} (nix), {flatpak-all} (flatpak)";
        }
        {
          type = "wm";
          key = " ├WM ";
        }
        {
          type = "shell";
          key = " └Shell ";
        }

        {
          type = "cpu";
          key = "CPU ";
          format = "{name}";
        }
        {
          type = "gpu";
          key = " ├GPU 󰟀";
          format = "{vendor} {name} [{type}]";
        }
        {
          type = "memory";
          key = " ├RAM ";
          format = "{used}/{total}";
        }
        {
          type = "disk";
          key = " └Disk ";
          format = "{size-used}/{size-total}";
        }
        {
          type = "colors";
          block.width = 2;
        }
      ];
    };
  };
}
