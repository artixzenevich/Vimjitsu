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

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'sharkdp/fd'},
			{'nvim-treesitter/nvim-treesitter'}
		}
	}
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

	use({
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup(
				{
  welcome_message = WELCOME_MESSAGE,
  loading_text = "loading",
  question_sign = "", -- you can use emoji if you want e.g. 🙂
  answer_sign = "ﮧ", -- 🤖
  max_line_length = 120,
  yank_register = "+",
  chat_layout = {
    relative = "editor",
    position = "50%",
    size = {
      height = "80%",
      width = "80%",
    },
  },
  settings_window = {
    border = {
      style = "rounded",
      text = {
        top = " Settings ",
      },
    },
  },
  chat_window = {
    filetype = "chatgpt",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top = " ChatGPT ",
      },
    },
  },
  chat_input = {
    prompt = "  ",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top_align = "center",
        top = " Prompt ",
      },
    },
  },
  openai_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "code-davinci-edit-001",
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  keymaps = {
    close = { "<C-c>" },
    submit = "<C-Enter>",
    yank_last = "<C-y>",
    yank_last_code = "<C-k>",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    toggle_settings = "<C-o>",
    new_session = "<C-n>",
    cycle_windows = "<Tab>",
    -- in the Sessions pane
    select_session = "<Space>",
    rename_session = "r",
    delete_session = "d",
  },
}
			)
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})

	use { "catppuccin/nvim", as = "catppuccin" }

end)
