local detail = false

return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		config = function()
			require("utils.oil_winbar")

			require("oil").setup({
				skip_confirm_for_simple_edits = true,
				prompt_save_on_select_new_entry = false,
				win_options = {
					winbar = "%!v:lua.get_oil_winbar()",
				},
				keymaps = {
					["gd"] = {
						desc = "Toggle file detail view",
						callback = function()
							detail = not detail
							if detail then
								require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
							else
								require("oil").set_columns({ "icon" })
							end
						end,
					},
				},
				float = {
					padding = 0,
					max_width = 0.7,
					max_height = 0.7,
					preview_split = "right",
				},
			})
		end,
	},

	{
		"benomahony/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = function()
			require("oil-git").setup({
				highlights = {
					OilGitAdded = { fg = "#b8bb26" }, -- green
					OilGitModified = { fg = "#fabd2f" }, -- yellow
					OilGitRenamed = { fg = "#d3869b" }, -- purple
					OilGitUntracked = { fg = "#458588" }, -- blue
					OilGitIgnored = { fg = "#928374" }, -- gray
				},
			})
		end,
	},

	{
		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
}
