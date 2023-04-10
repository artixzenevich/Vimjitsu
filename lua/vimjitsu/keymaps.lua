vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set('i', 'jk', '<escape>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>q', ':q<CR>')

