{pkgs, ...}: # Home file for Insert user.

{
  programs.home-manager.enable = true;
  font = "DepartureMono Nerd Font";
  palette = {
    name = "TokyoNight";
    pri = "magenta";
    sec = "blue";
    fg = "white";
    bg = "black";
  };

  # Enable home manager for all users.
  home = {
    username = "insert";
    homeDirectory = "/home/insert";
    stateVersion = "25.05";
  };

  gtk = {
    enable = true;
    gtk2.enable = false;
    theme = {
      name = "Tokyonight-Purple-Dark-Compact";
      package = (pkgs.tokyonight-gtk-theme.override {
        themeVariants = ["purple"];
        sizeVariants = ["compact"];
        colorVariants = ["dark"];
      });
    };

    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };
    cursorTheme.size = 48;
    cursorTheme.name = "miku-cursor-linux";
  };

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "http://github.com/supermariofps/hatsune-miku-windows-linux-cursors/releases/latest/download/miku-cursor-linux.tar.xz"
        "sha256-qxWhzTDzjMxK7NWzpMV9EMuF5rg9gnO8AZlc1J8CRjY="
        "miku-cursor-linux";

  imports = [
    ./themes/retro/theme.nix
    ./opts.nix
  ];
}
