local M = {}

function M.setup()
  require("telescope").setup {
    extensions = {
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
      },
    },
  }

  require("telescope").load_extension "file_browser"

  vim.keymap.set("n", "sf", function()
    require('telescope').extensions.file_browser.file_browser({
      path = "%:p:h",
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 40 }
    })
  end)

end

return M
