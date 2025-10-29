{pkgs, lib, ...}: # Neovim configuration.
let 
  image-nvimNew = pkgs.vimPlugins.image-nvim.overrideAttrs (old: {
  src = pkgs.fetchzip {
        url = "https://github.com/3rd/image.nvim/archive/v1.4.0.zip";
        sha256 = "sha256-EaDeY8aP41xHTw5epqYjaBqPYs6Z2DABzSaVOnG6D6I=";
      };
    });
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;

    # Set some options.
    extraConfig = ''
      set number
      set relativenumber
      colorscheme tokyonight-night
      set cindent
      set expandtab
      set tabstop=2
      set shiftwidth=2
      inoremap " ""<left>
      inoremap ( ()<left>
      inoremap [ []<left>
      inoremap { {}<left>
      let mapleader = "\<Space>"
      nmap <leader>c = :wqall<cr>
      nmap <leader>f :FZF<cr>
      tnoremap <Esc> <C-\><C-n>

      set nocompatible
      filetype plugin on
      syntax on
    '';

    extraLuaPackages = ps: [ps.magick];
    extraPackages = [pkgs.imagemagick];

    plugins = with pkgs.vimPlugins; [
      # Fuzzy finding.
      fzfWrapper

      # Make stuff look good.
      lualine-nvim
      tokyonight-nvim

      # Autocompletion(gonna add this into nix shells later.).
#      nvim-lspconfig
#      cmp-nvim-lsp
#      cmp-buffer
#      cmp-path
#      cmp-cmdline
#      nvim-cmp

      # For school notes.
      vimwiki
      image-nvimNew
    ];

    # Lua configuration files for plugins.  
    extraLuaConfig = ''
      ${builtins.readFile ./line.lua}
      require("image").setup({
        backend = "sixel",
        integrations = {
          markdown = {
            only_render_image_at_cursor = true,
            only_render_image_at_cursor_mode = "inline",
          },
        },
      })
    '';
#      ${builtins.readFile ./cmp.lua}
  };
}
