-- Jitsuvim - 2023
vim.opt.swapfile = false
vim.opt.shell = 'fish'
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.fixeol = false
vim.opt.completeopt = 'menuone,noselect'
vim.opt.timeoutlen = 300
vim.cmd("autocmd BufEnter * set fo-=c fo-=r fo-=o")
