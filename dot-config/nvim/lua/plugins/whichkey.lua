return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				{ "<leader>q", desc = "Quit" },
				{ "<leader>w", desc = "Write" },
				{ "<leader>f", group = "File" },
				{ "<leader>fs", desc = "Find Symbols" },
				{ "<leader>fh", desc = "Find Help" },
				{ "<leader>g", group = "Git" },
				{ "<leader>p", group = "Paste" },
				{ "<leader>ps", desc = "Paste Saving" },
				{ "<leader>r", group = "Runner" },
				{ "<leader>s", desc = "Replace Word" },
				{ "<leader>v", group = "LSP" },
				{ "<leader>vc", group = "Code" },
				{ "<leader>vca", desc = "Code Action" },
				{ "<leader>vd", desc = "Show Diagnostics" },
				{ "<leader>vr", group = "References" },
				{ "<leader>vrn", desc = "Rename" },
				{ "<leader>vrr", desc = "Find References" },
				{ "<leader>vw", group = "Workspace" },
				{ "<leader>vws", desc = "Workspace Symbols" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>x", group = "Diagnostics" },
			})
		end,
	},
}
