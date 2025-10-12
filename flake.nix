{
  description = "Insert's NixOS config.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
  };

  outputs = {self, nixpkgs, ...}@inputs:
  {
    # System configurations.
    nixosConfigurations = {
      # My laptop.
      vivo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./sys/vivo.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };
  };
}
