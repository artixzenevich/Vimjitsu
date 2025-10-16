local map = vim.keymap.set
vim.g.mapleader = " "

map("i", "jk", "<escape>")
map("n", "<leader>w", ":write<CR>", { silent = true })
map("n", "<leader>q", ":quit<CR>", { silent = true })

-- Управление буфером
map("n", "<Tab>", ":bprev<CR>", { silent = true })
map("n", "<S-Tab>", ":bnext<CR>", { silent = true })
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

map("n", "<space>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<space>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<space>fb", ":Telescope buffers<CR>", { silent = true })

-- Перезагрузка конфига
map("n", "<leader>r", function()
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

-- Открывает Oil сразу в режиме предпросмотра
map("n","<space>e", function ()
    require("oil").toggle_float()
    vim.defer_fn(function()
	require("oil").open_preview()
    end, 100) -- оптимальное время задержки
end)
