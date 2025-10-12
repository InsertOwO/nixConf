{pkgs, ...}: # A prettier boot.

{
  boot = {
    # GRUB with UEFI support.
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;

        # Search installed OS's.
        useOSProber = true;

        # Make GRUB prettier.
        splashImage = ../../assets/grub.png;
        font = ../../assets/grub.ttf;
        fontSize = 30;
      };
      efi.canTouchEfiVariables = true;
    };
    # Boot up animation.
#    plymouth.enable = true;

    # Stop console messages.
#    consoleLogLevel = 0;
#    initrd.verbose = false;
#    kernelParams = [
#      "boot.shell_on_fail"
#      "loglevel=3"
#      "quiet"
#      "rd.systemd.show_status=false"
#      "rd.udev.log_level=3"
#      "splash"
#      "udev.log_priority=3"
#    ];
  };
  
  # This number is too complex to explain, just keep off it.
  system.stateVersion = "25.05";
}
