{config, pkgs, ...}: # Home file for Insert user.

{
  programs.home-manager.enable = true;

  # Enable home manager for all users.
  home = {
    username = "${config.name}";
    homeDirectory = "/home/${config.name}";
    stateVersion = "25.05";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Purple-Dark-Compact";
      package = (pkgs.tokyonight-gtk-theme.override {
        themeVariants = ["purple"];
        sizeVariants = ["compact"];
        colorVariants = ["dark"];
      });
    };

    iconTheme = {
      name = "Tela-purple";
      package = pkgs.tela-icon-theme;
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
        "https://github.com/supermariofps/hatsune-miku-windows-linux-cursors/releases/download/1.2.6/miku-cursor-linux.tar.xz"
        "sha256-qxWhzTDzjMxK7NWzpMV9EMuF5rg9gnO8AZlc1J8CRjY="
        "miku-cursor-linux";


  imports = [
    ./opts.nix
  ];
}
