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
    systemPackages = with pkgs; [
      (zathura.override {plugins = with zathuraPkgs; [zathura_pdf_mupdf]; })
      pwvucontrol
      p7zip
      mpv
      swayimg

      hyfetch
      unrar
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
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };

  imports = [
    ./spellCheck.nix
  ];
}
