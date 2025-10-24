return {
    { "ellisonleao/gruvbox.nvim" },

    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                groups = {
                    "Normal",
                    "NormalNC",
                    "Comment",
                    "Constant",
                    "Special",
                    "Identifier",
                    "Statement",
                    "PreProc",
                    "Type",
                    "Underlined",
                    "Todo",
                    "String",
                    "Function",
                    "Conditional",
                    "Repeat",
                    "Operator",
                    "Structure",
                    "LineNr",
                    "NonText",
                    "SignColumn",
                    "CursorLine",
                    "CursorLineNr",
                    "StatusLine",
                    "StatusLineNC",
                    "EndOfBuffer",
                },
                extra_groups = {},
                exclude_groups = {
                    "NotifyBackground",
                },
                on_clear = function() end,
            })
        end,
    },

    -- Фикс предуприждения для Notify
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#282828", -- для gruvbox dark
            })
        end,
    },
}
