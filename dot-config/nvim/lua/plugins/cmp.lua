return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
					},
				},
				documentation = { auto_show = false },
				ghost_text = { enabled = true },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
