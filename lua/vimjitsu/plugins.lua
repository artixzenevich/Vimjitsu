return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ryanoasis/vim-devicons'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'rcarriga/nvim-notify'
  use 'folke/neodev.nvim'
  use 'folke/zen-mode.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'RRethy/vim-illuminate'
  use "MunifTanjim/nui.nvim"

  use {
    'xiyaowong/transparent.nvim',
    config = function() require("transparent").setup({
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = {
        'Normal'
      }, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    })
    end
  }

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = function()
      require('vimjitsu.configs.lsp').setup()
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('vimjitsu.configs.cmp').setup()
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('vimjitsu.configs.treesitter').setup()
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
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'palenight'
        }
      }
    end
  }

  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
