{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-surround
      dracula-vim
      nvim-web-devicons
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
            ensure_installed = { "lua_ls", "tsserver", "elixirls", "rust_analyzer", "zls", "yamlls", "tailwindcss" }
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
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      friendly-snippets
      { plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile(./cmp.lua);
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
