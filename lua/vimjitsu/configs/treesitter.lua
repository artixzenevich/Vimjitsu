local M = {}

function M.setup()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {'php', 'lua'},
    sync_install = true,
    auto_install = true,
  }
end

return M
