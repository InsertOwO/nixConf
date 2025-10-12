{...}: # My user account.

{
  # Define user account.
  users.users.insert = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager" # Use networkmanager without sudo.
    ];
  };

  # Set homemanager for user.
  home-manager.users.insert = import ../../home/insert.nix;
}
