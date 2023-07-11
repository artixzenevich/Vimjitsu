local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'nvim-tree/nvim-web-devicons',
  'nvim-lua/plenary.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-telescope/telescope.nvim',
  'kdheepak/lazygit.nvim',
  'folke/zen-mode.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'palenight'
        }
      }
    end
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { 'telescope.nvim', 'plenary.nvim' },
  },

  {
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
  },

  {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup(require"plugins.startup")
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },

  {
    'romgrk/barbar.nvim', 
    requires = 'nvim-web-devicons'
  },

  {
    'catppuccin/nvim', 
    as = 'catppuccin',
  }
})


