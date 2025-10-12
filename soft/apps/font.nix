{pkgs, ...}: # Fonts for the system.

{
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];
}
