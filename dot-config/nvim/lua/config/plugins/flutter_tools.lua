return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			ui = {
				notification_style = "plugin",
			},
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
				},
			},
		})
	end,
}
