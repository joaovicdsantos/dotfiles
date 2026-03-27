local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-gradle"),
		require("neotest-kotlin"),
	},
})

vim.keymap.set("n", "<leader>tt", function()
	neotest.run.run()
end, { desc = "Run Test" })

vim.keymap.set("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run Test (File)" })

vim.keymap.set("n", "<leader>to", function()
	neotest.output_panel.open({ enter = true })
end, { desc = "Show Test Output" })

vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Show Test Summary" })
