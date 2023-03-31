-- Основные плагины

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use { "catppuccin/nvim", as = "catppuccin" }

end)
