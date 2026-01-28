{...}: # Make importing the configurations easier.

{
  imports = [
    ./foot.nix
    ./zathura.nix
    ./nvim/nvim.nix
    ./fastfetch.nix
  ];
}
