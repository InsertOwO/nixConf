{...}: # Most minimal boot.

{
  boot.loader.systemd-boot.enable = true;
  
  # This number is too complex to explain, just keep off it.
  system.stateVersion = "25.05";
}
