{pkgs, ...}: # My user account.

{
  # Define user account.
  users.users.school = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager" # Use networkmanager without sudo.
    ];
    packages = [
      pkgs.libreoffice
    ];
  };

  # Set homemanager for user.
  home-manager.users.school = import ../../home/school.nix;
}
