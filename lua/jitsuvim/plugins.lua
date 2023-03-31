vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

	use 'nvim-lualine/lualine.nvim'
	use 'norcalli/nvim-colorizer.lua'

	use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v1.x',
  	requires = {
    	-- LSP Support
    	{'neovim/nvim-lspconfig'},
    	{
      	'williamboman/mason.nvim',
      	run = function() pcall(vim.cmd, 'MasonUpdate') end
    	},
    	{'williamboman/mason-lspconfig.nvim'},

    	-- Autocompletion
    	{'hrsh7th/nvim-cmp'},
    	{'hrsh7th/cmp-buffer'},
    	{'hrsh7th/cmp-path'},
    	{'saadparwaiz1/cmp_luasnip'},
    	{'hrsh7th/cmp-nvim-lsp'},
    	{'hrsh7th/cmp-nvim-lua'},

    	-- Snippets
    	{'L3MON4D3/LuaSnip'},
    	{'rafamadriz/friendly-snippets'},
		}
	}

	use 'folke/zen-mode.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

	use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

	use 'windwp/nvim-ts-autotag'

	use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

	use {
		"windwp/nvim-autopairs",
 	   config = function() require("nvim-autopairs").setup {} end
	}
	
	use {
  	"nvim-neo-tree/neo-tree.nvim",
    	branch = "v2.x",
    	requires = { 
      	"nvim-lua/plenary.nvim",
      	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      	"MunifTanjim/nui.nvim",
    }
  }

	use {
  	 "folke/which-key.nvim",
  	 config = function()
    	 require("jitsuvim.config.whichkey").setup()
   	end,
	}
	use { "catppuccin/nvim", as = "catppuccin" }

end)
