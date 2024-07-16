{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-surround
      dracula-vim
      { plugin = nvim-treesitter.withAllGrammars;
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
      { plugin = telescope-nvim;
        type = "lua";
        config = ''
          local builtin = require('telescope.builtin')

          vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
          vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
          vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
        '';
      }
      { plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1
          require("nvim-tree").setup()
          vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
       '';
      }
      { plugin = lualine-nvim;
        type = "lua";
        config = ''
          require('lualine').setup({
            options = {
              icons_enabled = true,
              theme = "dracula",
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
      { plugin = mason-nvim;
        type = "lua";
        config = "require('mason').setup()";
      }
      { plugin = mason-lspconfig-nvim;
        type = "lua";
        config = ''
          require('mason-lspconfig').setup({
            ensure_installed = { "lua_ls", "tsserver", "elixirls", "rust_analyzer", "zls", "yamlls", "tailwindcss", "gopls", "emmet_language_server" }
          })
        '';
      }
      { plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile(./lspconfig.lua);
      }
      { plugin = lsp_signature-nvim;
        type = "lua";
        config = ''
          require('lsp_signature').setup({
            floating_window = false,
          })
        '';
      }
      cmp_luasnip
      cmp-nvim-lsp
      friendly-snippets
      { plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile(./cmp.lua);
      }
      { plugin = luasnip;
        type = "lua";
        config = ''
          require('luasnip.loaders.from_vscode').lazy_load()
        '';
      }
      { plugin = vim-test;
        type = "lua";
        config = ''
          vim.cmd [[ 
            let test#strategy = "neovim"
          ]]
          vim.keymap.set('n', '<leader>t', ':TestNearest<CR>')
          vim.keymap.set('n', '<leader>T', ':TestFile<CR>')
          vim.keymap.set('n', '<leader>b', ':b#<CR>')
        '';
      }
    ];
    extraConfig = ''
      lua << EOF
      ${builtins.readFile(./remap.lua)}
      EOF
    '';
  };
}
