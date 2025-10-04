local oil = require("oil")

oil.setup({
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
    end, 100)
end)
