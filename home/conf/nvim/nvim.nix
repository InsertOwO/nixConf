{pkgs, ...}: # Neovim configuration.

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
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
    ];

    # Lua configuration files for plugins.  
    extraLuaConfig = ''
      ${builtins.readFile ./line.lua}
    '';
#      ${builtins.readFile ./cmp.lua}
  };
}
