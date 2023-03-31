local map = vim.api.nvim_set_keymap
local default_opt = { noremap = true, silent = true }
local expr_opt =  { noremap = true, expr = true, silent = true }

local mapleader = " "

map('i', 'jk', '<escape>', default_opt)
map('n', '<Space>e', '<Cmd>NeoTreeFocusToggle<CR>', default_opt)
map('n', '<Space>o', '<Cmd>NeoTreeFocus<CR>', default_opt)
map('n', '<Space>w', '<Cmd>w<CR>', default_opt)
map('n', '<Space>q', '<Cmd>q<CR>', default_opt)
map('n', '<Space>z', '<Cmd>ZenMode<CR>', default_opt)
map('n', '<Space>x', '<Cmd>close<CR>', default_opt)
