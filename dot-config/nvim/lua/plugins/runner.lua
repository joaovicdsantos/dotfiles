return {
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
		opts = {
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
				dart = "dart run $fileName",
				c = function()
					local c_base = {
						"cd $dir &&",
						"gcc $fileName -o",
						"/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"&& /tmp/$fileNameWithoutExt &&",
						"rm /tmp/$fileNameWithoutExt",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						c_base[4] = input
						require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
					end)
				end,
			},
		},
		keys = {
			{
				"<leader>rr",
				function()
					require("code_runner").run_code()
				end,
				desc = "Run Code",
			},
			{
				"<leader>rf",
				function()
					require("code_runner").run_filetype()
				end,
				desc = "Run File",
			},
			{
				"<leader>rp",
				function()
					require("code_runner").run_project()
				end,
				desc = "Run Project",
			},
			{
				"<leader>rc",
				function()
					require("code_runner").run_close()
				end,
				desc = "Close Runner",
			},
		},
	},
}
