{...}: # A prettier boot.

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
  };
}
