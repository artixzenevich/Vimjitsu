local M = {}

function M.setup()
  local lsp = require('lsp-zero').preset({})

  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
  end)

  -- (Optional) Configure lua language server for neovim
  --require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
  --require('lspconfig').emmet_ls.setup({
      -- on_attach = on_attach,
    --  filetypes = { "css", "html", "javascriptreact", "typescriptreact", "php" },
  --})

  lsp.setup()
end

return M
