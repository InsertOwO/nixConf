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
    firefox = {
      enable = true;
      package = pkgs.librewolf;
      policies = {
        ExtensionSettings = {
          # Block all extensions except the config ones.
          "*".installation_mode = "blocked";
          #Ublock Origin
          "uBlock0@raymondhill.net" = {
            install_url =  "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          #ClearURLs
          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
            installation_mode = "force_installed";
          };
          #Privacy Badger
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };
          #PopUpOff
          "{154cddeb-4c8b-4627-a478-c7e5b427ffdf}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/popupoff/latest.xpi";
            installation_mode = "force_installed";
          };
          #Nitter
          "{7b74340a-30bf-4a45-aefa-8a0de3096062}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/nitter/latest.xpi";
            installation_mode = "force_installed";
          };
          #Tokyonight
          "{c6698fd1-fe9b-4eae-95d5-fe1703820469}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tokyo-night-theme-for-firefox/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
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

      pcmanfm

      hyfetch
      unrar
    ];
  };

#  home-manager.sharedModules = [
#    {
#      xdg.desktopEntries.swayimg = {
#        name = "SwayImg";
#        icon = "image-x-generic";
#        exec = "swayimg";
#      };
#    }
#  ];

#  xdg.mime = {
#    enable = true;
#    defaultApplications = {
#      "image/png" = "swayimg.desktop";
#      "image/jpeg" = "swayimg.desktop";
#      "image/gif" = "swayimg.desktop";
#      "image/webp" = "swayimg.desktop";
#      "application/pdf" = "org.pwmt.zathura.desktop";
#    };
#  };

  imports = [
    ./spellCheck.nix
  ];
}
