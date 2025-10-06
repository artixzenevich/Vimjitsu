require "telescope".setup({
    extensions = {
	media_files = {
	  -- filetypes whitelist
	  -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
	  filetypes = {"png", "webp", "jpg", "jpeg"},
	  -- find command (defaults to `fd`)
	  find_cmd = "rg"
	}
    },
})

vim.keymap.set("n", "<space>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<space>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<space>fb", ":Telescope buffers<CR>", { silent = true })
