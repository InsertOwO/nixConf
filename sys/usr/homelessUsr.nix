{...}: # Homeless user.

{
  # Define user account.
  users.users.user = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager" # Use networkmanager without sudo.
    ];
  };
}
