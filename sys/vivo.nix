{...}: # The one on my laptop.

{
  networking = {
    hostName = "insert";
    networkmanager.enable = true;
  };

  imports = [
    ../soft/softVivo.nix

    ./usr/insertUsr.nix
    ./usr/schoolUsr.nix
    ./hw/vivoHw.nix

    ./etc/conf.nix
    ./etc/swap.nix
    ./etc/time.nix
    ./etc/shell.nix
    ./etc/blue.nix
    ./etc/nix.nix
    ./etc/console.nix
    ./boot/boot.nix
  ];
}
