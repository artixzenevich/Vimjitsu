require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "markdown",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "vim",
    "astro"
  },
  autotag = {
    enable = true,
  }, 
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
