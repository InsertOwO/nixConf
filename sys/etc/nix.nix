{...}: # Enable flakes and garbage-collector.

{
  # Manage Nix.
  nix = {
    # Enable flakes.
    settings.experimental-features = [
      "nix-command"
      "flakes"
	 ];

    # Optimise the Nix store.
    optimise.automatic = true;

    # Garbage collector stuff.
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;
}
