vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set('i', 'jk', '<escape>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>q', ':q<CR>')

keymap.set('n', '<Tab>', ':BufferNext<CR>')
keymap.set('n', '<S-Tab>', ':BufferPrevious<CR>')

keymap.set('n', 'ff', ':Telescope find_files<CR>')
keymap.set('n', 'fg', ':Telescope live_grep<CR>')
--keymap.set('n', '<leader>e', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')
