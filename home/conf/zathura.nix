{pkgs, config, ...}:

{
  programs.zathura = {
    enable = true;
    package = (pkgs.zathura.override {
        plugins = [pkgs.zathuraPkgs.zathura_pdf_mupdf];
    });
    options = {
      font = "${config.font}";

      default-bg = "#${config.pal.bg1}";
      default-fg = "#${config.pal.fg1}";

      statusbar-bg = "#${config.pal.bg2}";
      statusbar-fg = "#${config.pal.fg1}";
      
      inputbar-bg = "#${config.pal.bg1}";
      inputbar-fg = "#${config.pal.pri1}";

      completion-bg = "#${config.pal.bg2}";
      completion-fg = "#${config.pal.fg1}";

      completion-group-bg = "#${config.pal.bg1}";
      completion-group-fg = "#${config.pal.fg1}";
      
      completion-highlight-bg = "#${config.pal.sec1}";
      completion-highlight-fg = "#${config.pal.bg1}";

      recolor-darkcolor = "#${config.col.white1}";
      recolor-lightcolor = "#${config.col.black1}";

      index-active-bg = "#${config.pal.sec1}";
      index-active-fg = "#${config.pal.bg1}";

      index-bg = "#${config.pal.bg2}";
      index-fg = "#${config.pal.fg1}";
    };
  };
}
