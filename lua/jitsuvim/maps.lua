-- Основные бинды редактора

local map = vim.api.nvim_set_keymap
local default_opt = { noremap = true, silent = true }
local expr_opt =  { noremap = true, expr = true, silent = true }

local mapleader = " "

--[[ Метод для установки горячих клавиш
mod - {string} строка с режимом (n,i,v,t)
key - {string} строка с горячей клавишей
command - {string} строка 
]]--

function bind(mod, key, command)
	map(mod, key, command, {noremap = true })
end

bind('i', 'jk', '<escape>')
