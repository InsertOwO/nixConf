{pkgs, ...}: # The one on my laptop.

{
  boot.kernelPackages = pkgs.linuxPackages_6_6;
  hardware.enableAllFirmware = true;
  networking = {
    hostName = "vivo";
    networkmanager.enable = true;
  };

  imports = [
    ../soft/softVivo.nix

    ./usr/insertUsr.nix
    ./usr/schoolUsr.nix
    ./hw/vivoHw.nix

    ./etc/swap.nix
    ./etc/time.nix
    ./etc/shell.nix
    ./etc/blue.nix
    ./etc/nix.nix
    ./etc/console.nix
    ./boot/boot.nix
  ];
}
