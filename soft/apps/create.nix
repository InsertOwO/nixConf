{pkgs, ...}:

{
  programs.obs-studio = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    shotcut
    gimp3
    krita

    reaper
  ];
}
