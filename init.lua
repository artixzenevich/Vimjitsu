--[[
░██    ░██ ░██                    ░█████ ░██   ░██
░██    ░██                          ░██        ░██
░██    ░██ ░██░█████████████        ░██  ░██░████████  ░███████  ░██    ░██
░██    ░██ ░██░██   ░██   ░██       ░██  ░██   ░██    ░██        ░██    ░██
 ░██  ░██  ░██░██   ░██   ░██ ░██   ░██  ░██   ░██     ░███████  ░██    ░██
  ░██░██   ░██░██   ░██   ░██ ░██   ░██  ░██   ░██           ░██ ░██   ░███
   ░███    ░██░██   ░██   ░██  ░██████   ░██    ░████  ░███████   ░█████░██
]]

require("config.options")
require("core.lazy")
require("core.lsp")
require("config.keymaps")
require("config.autocmds")

-- Отключение '~' в колонке с нумерацией строк
vim.cmd [[
  highlight EndOfBuffer guifg=#1F1F28 guibg=NONE ctermfg=NONE ctermbg=NONE
]]
