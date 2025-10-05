require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	keymap = {
	    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
	    ['<C-e>'] = { 'hide', 'fallback' },
	    ['<CR>'] = { 'accept', 'fallback' },

	    ['<S-Tab>'] = { 'select_prev', 'fallback' },
	    ['<Tab>'] = { 'select_next', 'fallback' },
	    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
	    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

	    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
	    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

	    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
	},
	fuzzy = { implementation = "lua"  }
})

