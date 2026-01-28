{...}:

{
  services.flatpak = {
    enable = true;
    packages = [
      "com.zandronum.Zandronum"
      "org.vinegarhq.Sober"
    ];
    
    overrides = {
      global = {
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };
    };
  };
}
