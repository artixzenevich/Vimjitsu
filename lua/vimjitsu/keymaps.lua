vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set('i', 'jk', '<escape>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>q', ':q<CR>')

keymap.set('n', '<A-d>', ':BufferNext<CR>')
keymap.set('n', '<A-a>', ':BufferPrevious<CR>')
keymap.set('n', '<leader>c', ':BufferClose<CR>')

keymap.set('n', 'ff', ':Telescope find_files<CR>')
keymap.set('n', 'fg', ':Telescope live_grep<CR>')
keymap.set('n', '<leader>z', ':ZenMode<CR>')
