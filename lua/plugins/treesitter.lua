require('nvim-treesitter.configs').setup{
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
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
    "vim"
  },
  autotag = {
    enable = true,
  }, 
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
