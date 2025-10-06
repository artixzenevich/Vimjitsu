-- https://github.com/stevearc/oil.nvim
local oil = require("oil")

oil.setup({
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false, 
    keymaps = {
	["g?"] = { "actions.show_help", mode = "n" },
	["<CR>"] = "actions.select",
	["<C-s>"] = { "actions.select", opts = { vertical = true } },
	["<C-h>"] = { "actions.select", opts = { horizontal = true } },
	["<C-t>"] = { "actions.select", opts = { tab = true } },
	["<C-p>"] = "actions.preview",
	["<C-c>"] = { "actions.close", mode = "n" },
	["<C-l>"] = "actions.refresh",
	["-"] = { "actions.parent", mode = "n" },
	["_"] = { "actions.open_cwd", mode = "n" },
	["`"] = { "actions.cd", mode = "n" },
	["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
	["gs"] = { "actions.change_sort", mode = "n" },
	["gx"] = "actions.open_external",
	["g."] = { "actions.toggle_hidden", mode = "n" },
	["g\\"] = { "actions.toggle_trash", mode = "n" },
    },

    view_options = {
	-- Показывать файлы и каталоги, имена которых начинаются с "."
	show_hidden = true,
    },

    -- Настройка плавающего окна для oil.open_float
    float = {
	padding = 2,
	max_width = 0.9,
	max_height = 0.9,
	preview_split = "right"
    }
})

vim.keymap.set("n","<space>e", function ()
   oil.toggle_float()
    -- Открывает Oil сразу в режиме предпросмотра
    vim.defer_fn(function()
	oil.open_preview()
    end, 100) -- оптимальное время задержки
end)
