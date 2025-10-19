return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
        config = function()
            require("oil").setup({
                skip_confirm_for_simple_edits = true,
                prompt_save_on_select_new_entry = false,
		float = {
		    padding = 0,
		    max_width = 0.9,
		    max_height = 0.9,
		    preview_split = "right",
		},
            })
        end,
    },

    {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' }
    },

}
