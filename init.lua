require('vimjitsu.options')
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

require('vimjitsu.plugins')

vim.cmd.colorscheme "catppuccin-mocha"

vim.api.nvim_add_user_command('Upper', 'echo toupper(<q-args>)', { nargs = 1 })
-- :command! -nargs=1 Upper echo toupper(<q-args>)

vim.cmd('Upper hello world') -- prints "HELLO WORLD"
