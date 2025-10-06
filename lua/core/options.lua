-- Общие настройки
vim.cmd([[set noswapfile]])
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0

-- Настройки буфера обмена
vim.opt.clipboard = "unnamedplus"  -- синхронизация с системным буфером

-- Горячие клавиши для копирования в системный буфер
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })  -- Ctrl+C в Visual mode
vim.keymap.set("n", "<C-c>", '"+yy', { noremap = true, silent = true }) -- Ctrl+C для всей строки

-- Альтернативные комбинации (если Ctrl+C не работает)
vim.keymap.set("v", "<Leader>y", '"+y', { noremap = true, silent = true })  -- Leader+y в Visual mode
vim.keymap.set("n", "<Leader>y", '"+yy', { noremap = true, silent = true }) -- Leader+y для всей строк
