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


local oil = require("oil")

-- Создаем toggle функцию
local function toggle_oil()
    local oil_open = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "oil" then
            oil_open = true
            break
        end
    end

    if oil_open then
        -- Закрыть все Oil окна
        vim.cmd("bd")
    else
        -- Открыть Oil
        oil.open()
    end
end

-- Настройка маппинга
vim.keymap.set("n", "<space>e", toggle_oil, { desc = "Toggle Oil" })




