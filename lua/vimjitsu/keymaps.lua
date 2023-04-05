--[[
Leader keyboard shortcut settings can be found 
in the whichkey configuration at lua/vimjitsu/plugins/config/whichkey.lua
]]--
local keymap = vim.keymap

-- Space key as leader
vim.g.mapleader = " "

-- Use jk to exit insert mode 
keymap.set('i', 'jk', '<escape>')

-- Window management
keymap.set("n", "<C-v>", "<C-w>v") -- split window vertically
keymap.set("n", "<C-h>", "<C-w>s") -- split window horizontally

-- Buffer moving
keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprevious<CR>")
