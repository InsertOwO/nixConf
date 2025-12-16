{pkgs, config, lib, ...}: # Fonts for the system.

{
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.roboto-mono
  ];
}
