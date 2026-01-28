{...}:

{
  programs = {
    fastfetch = {
      enable = true;
      settings = {
        display = {
          color = "magenta";
          separator = "  ";
          size.binaryPrefix = "jedec";
        };
        logo = {
          source = ./meSmoll;
          color."1" = "white";
          padding = {
            right = 4;
            left = 1;
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

    hyfetch = {
      enable = true;
      settings = {
        preset = "bisexual";
        light_dark = "dark";
        color_align.mode = "horizontal";
        backend = "fastfetch";
        custom_ascii_path = "${builtins.path {path = ../../assets/bg.png;}}";
      };
    };
  };
}
