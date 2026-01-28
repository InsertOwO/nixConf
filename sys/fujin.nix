{...}: # The one on the media station.

{
  networking = {
    hostName = "fujin";
    networkmanager.enable = true;
  };

  imports = [
    ../soft/softFujin.nix

    ./hw/fujinHw.nix

    ./etc/swap.nix
    ./etc/time.nix
    ./etc/shell.nix
    ./etc/nix.nix
    ./boot/bootMin.nix
  ];
}
