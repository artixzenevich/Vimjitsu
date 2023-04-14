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

keymap.set('n', '<leader>g', ':LazyGit<CR>')

keymap.set('n', '<leader>a', ':AerialToggle<CR>')

keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')
keymap.set('n', '<left>', '<C-w><')
keymap.set('n', '<right>', '<C-w>>')
keymap.set('n', '<up>', '<C-w>+')
keymap.set('n', '<down>', '<C-w>-')

keymap.set('n', 'ai', ':ChatGPT<CR>')

keymap.set('n', 'cc', ':IlluminateToggle<CR>')
