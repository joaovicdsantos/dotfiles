return {
	-- Icons (required by most UI plugins)
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- Beautiful cmdline, messages and popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		},
	},

	-- LSP progress notifications
	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	-- Git signs in gutter
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "Git: " .. desc })
				end
				map("]g", gs.next_hunk, "Next Hunk")
				map("[g", gs.prev_hunk, "Prev Hunk")
				map("gt", gs.blame_line, "Blame Line")
				map("<leader>gp", gs.preview_hunk, "Preview Hunk")
				map("<leader>gr", gs.reset_hunk, "Reset Hunk")
			end,
		},
	},

	-- Highlight TODO/FIXME/NOTE comments
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- UI
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			animate = { enabled = true },
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = false },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			toggle = { enabled = true },
			win = { enabled = true },
		},
		keys = {
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
		},
	},
}
