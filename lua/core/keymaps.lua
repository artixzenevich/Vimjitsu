local map = vim.keymap.set
vim.g.mapleader = " "

map("i", "jk", "<escape>")
map("n", "<C-s>", ":write<CR>", { silent = true })
map("n", "<A-q>", ":quit<CR>", { silent = true })

-- Управление буфером
map("n", "<A-a>", ":bprev<CR>", { silent = true })
map("n", "<A-d>", ":bnext<CR>", { silent = true })
map("n", "<leader>c", ":bd<CR>", { silent = true })

-- Сплиты и перемещение между ними
map("n", "<leader>sv", "<cmd>vsplit<CR>")
map("n", "<leader>sh", "<cmd>split<CR>")
map("n", "<leader>sq", "<cmd>close<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<leader>;", ":")

-- Перезагрузка конфига
map("n", "<A-r>", function()
    local success, result = pcall(vim.cmd, "so")
    if success then
	vim.notify("Конфигурация успешно перезагружена", "info", {
	    title = "Neovim Config",
	})
    else
	vim.notify("Ошибка при перезагрузке: " .. tostring(result), "error", {
	    title = "Ошибка конфигурации",
	    timeout = 5000
	})
    end
end)
