--VimJitsu-PDE 

require('vimjitsu.base')
require('vimjitsu.keymaps')
require('vimjitsu.plugins-setup') 
require('vimjitsu.plugins.lsp-zero')
require('vimjitsu.plugins.nvim-tree')
require('vimjitsu.plugins.bufferline')

--[[ Choosing a color scheme ]]--
-- Install the new color scheme in the plugins-setup.lua file
vim.cmd.colorscheme  'catppuccin-mocha'


