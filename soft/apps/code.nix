{pkgs, ...}:

{
  programs.git.enable = true;  

  environment = {
    # For some reason setting this in home-manager doesnt work.
    variables.EDITOR = "nvim";
    variables.MANPAGER = "nvim +Man!";

    systemPackages = with pkgs; [
      gcc

      man-pages
      man-pages-posix
    ];
  };
}
