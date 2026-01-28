{pkgs, ...}: # Neovim configuration.

{
  home.packages = with pkgs; [ ripgrep ccls nil ];
  programs.neovim = {
    enable = true;
    viAlias = true;

    # Set some options.
    extraConfig = ''
      set number
      set relativenumber
      set expandtab
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      inoremap " ""<left>
      inoremap ( ()<left>
      inoremap [ []<left>
      inoremap { {}<left>
      let mapleader = "\<Space>"
      nmap <leader>c = :wqall<cr>

      nnoremap <leader>q :bo 6sp +te<cr> i

      tnoremap <Esc> <C-\><C-n>
      colorscheme tokyonight-night

      nmap <leader>f = :Telescope find_files<cr>
      nmap <leader>g = :Telescope live_grep<cr>
      nmap <leader>h = :Telescope buffers<cr>

      au InsertEnter * lua vim.diagnostic.enable(false)
      au InsertLeave * lua vim.diagnostic.enable(true)
      nmap <leader>d :lua vim.diagnostic.open_float()<cr>
    '';

    plugins = with pkgs.vimPlugins; [
      # Fuzzy finding.
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim

      # Make stuff look good.
      (nvim-treesitter.withPlugins (p: [p.c p.nix]))
      lualine-nvim
      tokyonight-nvim

      # Autocompletion.
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
    ];

    # Lua configuration files for plugins.  
    extraLuaConfig = ''
      ${builtins.readFile ./cmp.lua}
      ${builtins.readFile ./line.lua}
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }

      require('telescope').load_extension('fzf')

      require("tokyonight").setup({
        style = "night",
        transparent = true,
      })
      vim.cmd[[colorscheme tokyonight]]
    '';
  };
  programs.vim = {
    enable = true;
    packageConfigurable = pkgs.vim;
    plugins = [pkgs.vimPlugins.vimwiki];
    extraConfig = ''
      let mapleader = "\<Space>"
      set expandtab
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2

      set nocompatible
      filetype on
      syntax on
      let g:vimwiki_text_ignore_newline = 0
    '';

  };
}
