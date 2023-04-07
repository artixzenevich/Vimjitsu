--VimJitsu-PDE 

require('vimjitsu.base')
require('vimjitsu.keymaps')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


require('vimjitsu.plugins-setup') 
require('vimjitsu.plugins.lsp-zero')
require('vimjitsu.plugins.nvim-tree')
require('vimjitsu.plugins.bufferline')

--[[ Choosing a color scheme ]]--
-- Install the new color scheme in the plugins-setup.lua file
vim.cmd.colorscheme  'catppuccin-mocha'


