return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
 
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('vimjitsu.configs.treesitter')
    end
  }
  
  use {
	  "windwp/nvim-autopairs",
    config = function() 
      require("nvim-autopairs").setup {} 
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('vimjitsu.configs.telescope').setup()
    end
  }

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { 'telescope.nvim', 'plenary.nvim' },
  }

  use {'catppuccin/nvim', as = 'catppuccin'}

  use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

  use {
    "NTBBloodbath/galaxyline.nvim",
    config = function()
      require("galaxyline.themes.eviline")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
