return {
	-- Core DAP
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI for DAP
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
				keys = {
					{
						"<leader>du",
						function()
							require("dapui").toggle()
						end,
						desc = "DAP: Toggle UI",
					},
				},
				config = function()
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup()
					-- Auto open/close UI with DAP session
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},
			-- Virtual text for variables
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			-- Mason integration for debug adapters
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = { "mason-org/mason.nvim" },
				opts = {
					ensure_installed = { "python", "codelldb" },
					handlers = {},
				},
			},
		},
		keys = {
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle Breakpoint" },
			{ "<leader>dc", function() require("dap").continue() end, desc = "DAP: Continue" },
			{ "<leader>di", function() require("dap").step_into() end, desc = "DAP: Step Into" },
			{ "<leader>do", function() require("dap").step_over() end, desc = "DAP: Step Over" },
			{ "<leader>dO", function() require("dap").step_out() end, desc = "DAP: Step Out" },
			{ "<leader>dr", function() require("dap").repl.open() end, desc = "DAP: Open REPL" },
			{ "<leader>dq", function() require("dap").terminate() end, desc = "DAP: Terminate" },
		},
		config = function() end,
	},
}
