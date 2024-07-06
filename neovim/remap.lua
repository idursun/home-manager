vim.g.mapleader = ' '
vim.opt.backspace = '2'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.o.termguicolors = true

-- Some values from vim-sensible
vim.opt.incsearch = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.smarttab = true
vim.wo.relativenumber = true

vim.cmd [[ colorscheme dracula ]]
vim.keymap.set('n', "<C-f>", "<C-f>zz", { silent = true })
vim.keymap.set('n', "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set('t', "<C-j>", "<C-\\><C-N>", { silent = true })
vim.keymap.set('t', "<C-j>", "<C-\\><C-N>", { silent = true })
