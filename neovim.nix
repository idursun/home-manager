{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-surround
      dracula-vim
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require('nvim-treesitter.configs').setup({
            highlight = {
              enable = true,
            },
            indent = {
              enable = true,
            },
          })
        '';
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          local builtin = require('telescope.builtin')

          vim.keymap.set('n', '<c-p>', builtin.find_files, {})
          vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
          vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
          vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
        '';
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1

          require("nvim-tree").setup()

          vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
        '';
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require('lualine').setup({
            options = {
              icons_enabled = true,
            },
            sections = {
              lualine_a = {
                {
              'filename',
              path = 1,
            }
              }
            }
          })
        '';
      }
      {
        plugin = mason-nvim;
        type = "lua";
        config = ''
          require('mason').setup()
        '';
      }
      {
        plugin = mason-lspconfig-nvim;
        type = "lua";
        config = ''
          require('mason-lspconfig').setup({
            ensure_installed = { "lua_ls", "tsserver", "elixirls", "rust_analyzer",  }
          })
        '';
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
        local lspconfig = require('lspconfig')
        lspconfig.elixirls.setup({})
        lspconfig.rust_analyzer.setup({})
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev) 
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.ls.omnifunc'

            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({'v', 'n'}, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<space>f', function()
              vim.lsp.buf.format { async = true }
            end, opts)
          end,
        })
        '';
      }
      {
        plugin = lsp_signature-nvim;
        type = "lua";
        config = ''
          require('lsp_signature').setup({
            floating_window = false,
          })
        '';
      }
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      friendly-snippets
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp = require('cmp')
          require('luasnip.loaders.from_vscode').lazy_load()
          cmp.setup({
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-o>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          }, {
            { name = 'buffer' },
          }),
        })
        '';
      }
    ];
    extraConfig = ''
      lua << EOF
      vim.g.mapleader = ' '
      vim.opt.backspace = '2'
      vim.opt.tabstop = 2
      vim.opt.expandtab = true
      vim.o.termguicolors = true
      vim.cmd [[ colorscheme dracula ]]
      EOF
    '';
  };
}
