-- Общие настройки
vim.cmd([[set mouse=]])
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

local map = vim.keymap.set
vim.g.mapleader = " "

-- Добавление плагинов, без использования хиппстерских менеджеров.
-- Подробнее :help vim.pack.add()
vim.pack.add({
    { src = "https://github.com/rebelot/kanagawa.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" }, 
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/rcarriga/nvim-notify" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/sphamba/smear-cursor.nvim" },
})

require "telescope".setup()
require "mini.icons".setup()
require "mini.pairs".setup()
require "mini.tabline".setup()
require "smear_cursor".setup()
require "mini.comment".setup({
    mappings = {
	comment_line = '<leader>/',
    },
})

-- Конфигурация оповещений
local notify = require("notify")
vim.notify = notify

notify.setup({
    stages = "fade_in_slide_out", 
    timeout = 3000,
    background_colour = "Normal",
    icons = {
	ERROR = "",
	WARN = "",
	INFO = "",
	DEBUG = "",
	TRACE = "✎",
    },
})

-- Проводник
require("oil").setup({
    float = {
      padding = 0,
      max_width = 0.5,
      max_height = 0.5,
      border = "rounded",
    }
})

require "lualine".setup()

-- Бинды
map("i","jk", "<escape>")
-- Сохранение
map("n","<leader>w", function()
    local filename = vim.fn.expand("%:t")
    vim.cmd("write")

    if vim.bo.filetype ~= "oil" then
	notify("Файл '" ..filename.. "' сохранен", "info", { title="Сохранение"})
    end
end)
-- Выход
map("n","<leader>q", function()
    if vim.bo.modified then
	  vim.notify("Есть несохраненные изменения!", "warn", {
            title = "Выход",
            timeout = 3000
        })
    else
      vim.cmd("quit")
    end
end)
-- Перезагрузка конфига
map("n", "<leader>s", function()
    local success, result = pcall(vim.cmd, "so")
    if success then
        vim.notify("Конфигурация успешно перезагружена", "info", {
            title = "Neovim Config",
            icon = ""
        })
    else
        vim.notify("Ошибка при перезагрузке: " .. tostring(result), "error", {
            title = "Ошибка конфигурации",
            timeout = 5000
        })
    end
end)

-- Буфер
map("n","<A-a>", ":bprev<CR>")
map("n","<A-d>", ":bnext<CR>")
map("n","<leader>c", function()
     if vim.bo.modified then
	  vim.notify("Есть несохраненные изменения!", "warn", {
            title = "Закрыть буффер",
            timeout = 3000
        })
    else
      vim.cmd("bd")
    end   
end)

-- Проводник
map("n","<leader>e", ":Oil --float<CR>")

-- Бинды для Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")

-- Настройки ui и темы
vim.cmd("colorscheme kanagawa-wave")
