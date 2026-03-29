return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function(_, opts)
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.INFO] = "»",
						[vim.diagnostic.severity.HINT] = "⚑",
					},
					texthl = {
						[vim.diagnostic.severity.ERROR] = "Error",
						[vim.diagnostic.severity.WARN] = "Warn",
						[vim.diagnostic.severity.INFO] = "Info",
						[vim.diagnostic.severity.HINT] = "Hint",
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local map = function(keys, func, opts_)
						vim.keymap.set(
							"n",
							keys,
							func,
							vim.tbl_extend("force", { buffer = ev.buf, remap = false }, opts_ or {})
						)
					end
					map("gd", vim.lsp.buf.definition)
					map("gD", vim.lsp.buf.declaration)
					map("gi", vim.lsp.buf.implementation)
					map("K", vim.lsp.buf.hover)
					map("<leader>vws", vim.lsp.buf.workspace_symbol)
					map("<leader>vd", vim.diagnostic.open_float)
					map("[d", vim.diagnostic.goto_prev)
					map("]d", vim.diagnostic.goto_next)
					map("<leader>vca", vim.lsp.buf.code_action)
					map("<leader>vrr", vim.lsp.buf.references)
					map("<leader>vrn", vim.lsp.buf.rename)
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = ev.buf, remap = false })
				end,
			})

			require("mason").setup()

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local overrides = {
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						root_dir = function(fname)
							return vim.fs.dirname(fname)
						end,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
										vim.fn.stdpath("config"),
									},
								},
							},
						},
					})
				end,
			}

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" },
				handlers = {
					function(server)
						if overrides[server] then
							return overrides[server]()
						end

						require("lspconfig")[server].setup({
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},
}
