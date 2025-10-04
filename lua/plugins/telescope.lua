require "telescope".setup()

vim.keymap.set("n", "<space>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<space>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<space>fb", ":Telescope buffers<CR>", { silent = true })
