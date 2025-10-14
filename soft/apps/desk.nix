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

  environment = {
    # For some reason setting this in home-manager doesnt work.
    variables.EDITOR = "nvim";
    systemPackages = with pkgs; [
      git
      pwvucontrol
      p7zip
      mpv
      swayimg
    ];
  };

  home-manager.sharedModules = [
    {
      xdg.desktopEntries.swayimg = {
        name = "SwayImg";
        icon = "image-x-generic";
        exec = "swayimg";
      };
    }
  ];

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "image/png" = "swayimg.desktop";
      "image/jpeg" = "swayimg.desktop";
      "image/gif" = "swayimg.desktop";
      "image/webp" = "swayimg.desktop";
    };
  };

  imports = [
    ./spellCheck.nix
  ];
}
