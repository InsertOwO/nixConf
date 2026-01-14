-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- Native neovim snippets.

    -- insert({ body = args.body }) -- Insert at cursor
    -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
    -- require("cmp.config").set_onetime({ sources = {} })
  end,
},
-- window = {
--   completion = cmp.config.window.,
--   documentation = cmp.config.window.bordered(),
-- },

mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),

sources = cmp.config.sources({
  { name = 'nvim_lsp' },
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
vim.lsp.enable('ccls')
vim.lsp.config('ccls', {
  capabilities = capabilities
})
vim.lsp.enable('nil_ls')
vim.lsp.config('nil_ls', {
  capabilities = capabilities
})

