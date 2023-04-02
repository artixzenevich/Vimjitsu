vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
	use 'nvim-lualine/lualine.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'folke/zen-mode.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
	use 'windwp/nvim-ts-autotag'

	use {
		'nvim-tree/nvim-tree.lua',
		 requires = {
  	  	'nvim-tree/nvim-web-devicons',
		}
	}
	use { 'akinsho/nvim-bufferline.lua',  tag = "v3.*"}

	use { "catppuccin/nvim", as = "catppuccin" }

	use {
		'folke/which-key.nvim',
		config = function()
    	 require("vimjitsu.plugins.whichkey").setup()
   	end,
	}

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

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'sharkdp/fd'},
			{'nvim-treesitter/nvim-treesitter'}
		}
	}

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
		"jackMort/ChatGPT.nvim",
		config = function ()
			require'chatgpt'.setup(
				require('vimjitsu.plugins.chatgpt')
			)
		end,
   	requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
	}

	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
		config = function()
			require"startup".setup({theme = "vimjitsu"})
		end
	}

end)
