{pkgs, ...}:

{
  environment.systemPackages = with; pkgs [
    shotcut
    gimp3
  ];
}
