{pkgs, ...}: # The one on the media station.

{
  networking = {
    hostName = "medio";
    networkmanager.enable = true;
  };

  imports = [
    ../soft/softMedio.nix

    ./usr/insertUsr.nix
    ./hw/medioHw.nix

    ./etc/swap.nix
    ./etc/time.nix
    ./etc/shell.nix
    ./etc/blue.nix
    ./etc/nix.nix
    ./etc/console.nix
    ./boot/bootMin.nix
  ];
}
