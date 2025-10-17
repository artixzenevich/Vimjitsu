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
            })
        end
    }
}
