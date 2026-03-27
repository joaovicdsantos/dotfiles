local builtin = require("telescope.builtin")

local is_inside_work_tree = {}
local project_files = function()
	local opts = { find_command = { "rg", "--files", "--hidden", "-g", "!.git" } }

	local cwd = vim.fn.getcwd()
	if is_inside_work_tree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_work_tree[cwd] = vim.v.shell_error == 0
	end

	if is_inside_work_tree[cwd] then
		require("telescope.builtin").git_files(opts)
	else
		require("telescope.builtin").find_files(opts)
	end
end

local git_icon_defaults = {
	added = "+",
	changed = "~",
	copied = ">",
	deleted = "-",
	renamed = "➡",
	unmerged = "‡",
	untracked = "?",
}

vim.keymap.set("n", "<leader>ff", project_files, {})
vim.keymap.set("n", "<leader>fp", builtin.find_files, {})
vim.keymap.set("n", "<leader>fr", builtin.git_status, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
