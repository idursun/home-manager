local lspconfig = require('lspconfig')
lspconfig.elixirls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.zls.setup({})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev) 
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.ls.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({'v', 'n'}, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>L', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
