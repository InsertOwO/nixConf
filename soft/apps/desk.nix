{pkgs, ...}:

{
  # enable needed services.
  services = {
    # audio.
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
    };

    # automount new storage devices.
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

    # transfer files from phone.
    gvfs.enable = true;
  };

  programs = {  
    firefox.enable = true;
    yazi.enable = true;
    htop.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    pwvucontrol
    p7zip
    mpv
    swayimg
  ];

  imports = [
    ./spellCheck.nix
  ];
}
