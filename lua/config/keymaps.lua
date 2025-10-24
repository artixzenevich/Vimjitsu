local map = vim.keymap.set

map("i", "jk", "<escape>")

-- Управление буфферами
map("n", "<Tab>", ":bnext<CR>", { silent = true })
map("n", "<S-Tab>", ":bprev<CR>", { silent = true })
map("n", "<leader>c", ":bd<CR>", { silent = true })

-- Сплиты и перемещение между ними
map("n", "<leader>sv", "<cmd>vsplit<CR>")
map("n", "<leader>sh", "<cmd>split<CR>")
map("n", "<leader>sq", "<cmd>close<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
