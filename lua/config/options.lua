-- Общие настройки
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.clipboard = "unnamedplus"

-- Невидимые символы
vim.opt.list = true
vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
    nbsp = "␣",
}

vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
