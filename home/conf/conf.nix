{...}: # Make importing the configurations easier.

{
  imports = [
    ./foot.nix
    ./nvim/nvim.nix
    ./fastfetch.nix
  ];
}
