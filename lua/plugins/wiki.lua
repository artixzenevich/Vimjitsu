-- https://github.com/echaya/neowiki.nvim
require "neowiki".setup()
vim.keymap.set("n", "<leader>ow", require("neowiki").open_wiki, { desc = "Open Wiki" })
vim.keymap.set("n", "<leader>oW", require("neowiki").open_wiki_floating, { desc = "Open Floating Wiki" })
vim.keymap.set("n", "<leader>oT", require("neowiki").open_wiki_new_tab, { desc = "Open Wiki in Tab" })


