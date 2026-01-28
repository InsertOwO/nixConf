{pkgs, ...}: # Home file for School user.

{
  programs.home-manager.enable = true;
  font = "DepartureMono Nerd Font";
  palette = {
    name = "Pure";
    pri = "blue";
    sec = "cyan";
    fg = "black";
    bg = "white";
  };

  # Enable home manager for all users.
  home = {
    username = "school";
    homeDirectory = "/home/school";
    stateVersion = "25.05";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Chicago95";
      package = pkgs.chicago95;
    };

    iconTheme = {
      name = "Chicago95";
      package = pkgs.chicago95;
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
    ./themes/retro/theme.nix
    ./opts.nix
  ];
}
