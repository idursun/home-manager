local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})
lspconfig.tsserver.setup({})
lspconfig.elixirls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.zls.setup({})
lspconfig.yamlls.setup({})
lspconfig.gopls.setup({})
lspconfig.tailwindcss.setup({
  init_options = {
    elixir = "html-eex",
    eelixir = "html-eex",
    heex = "html-eex",
  },
})
lspconfig.emmet_language_server.setup({})

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
    vim.keymap.set('n', '<leader>e', function()
      vim.diagnostic.open_float(nil, { focusable = true })
    end, opts)
    vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { noremap = true, silent = true })
  end,
})
