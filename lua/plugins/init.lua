-- ВНИМАНИЕ!!! Данный функионал работает пока что в nightly версии nvim 12.0
-- Добавление плагинов.
-- Пока что работате на Nvim 0.12 (nightly) 
-- Подробнее :help vim.pack.add()
vim.pack.add({
    { src = "https://github.com/rebelot/kanagawa.nvim" },
    { src = "https://gicursorwordthub.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/folke/noice.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/sphamba/smear-cursor.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig.git" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/rcarriga/nvim-notify" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/Saghen/blink.cmp" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/max397574/startup.nvim" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/echaya/neowiki.nvim" },
})

-- Подключение конфигурации плагинов
require("plugins.oil")
require("plugins.telescope")
require("plugins.lualine")
require("plugins.noice")
require("plugins.wiki")

-- Если плагин не нуждаеться в конфигурировании, или требуют небольшой конфигурации, 
-- то просто подключаем его здесть: прим. reuiqre "plug".setup()
require "telescope".setup()
require "mini.icons".setup()
require "mini.pairs".setup()
require "mini.tabline".setup()
require "mini.cursorword".setup()
require "smear_cursor".setup()
require("startup").setup({theme = "vimjitsu"})
require('render-markdown').setup({
    file_types = { 'markdown' },
})

-- Общие настройки для LSP
require "mason".setup()
require "mason-lspconfig".setup()
require "mason-tool-installer".setup({
    ensure_installed = {
	"lua_ls",
	"stylua",
	"gopls",
	"pyright",
	"emmet-language-server"
    }
})

-- Инициализация сниппетов
require("luasnip.loaders.from_vscode").lazy_load()

-- TODO ВЫНЕСТИ ПОТОМ В ОТДЕЛЬНЫЙ ФАЙЛ
-- https://neovim.io/doc/user/lsp.html
vim.lsp.config["emmet_language_server"] = {
    filetypes = { "css", "html", "javascript", "javascriptreact", "sass", "scss", "typescriptreact", "php", "astro" },
}

vim.lsp.enable({
    "lua_ls",
    "pyright",
    "gopls",
    "emmet_language_server",
    "markdown_oxide"
})

require("plugins.cmp")

