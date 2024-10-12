local options = {
	autoindent = true,
	smartindent = true,
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	showtabline = 0,
	showmatch = true,

	number = true,
	relativenumber = true,
	numberwidth = 4,
	incsearch = true,
	hlsearch = true,
	ignorecase = true,
	smartcase = true,

	splitbelow = true,
	splitright = true,

	termguicolors = true,
  background = "dark",
	hidden = true,
	signcolumn = "yes",
	showmode = false,
	errorbells = false,
	wrap = true,
	cursorline = false,
	fileencoding = "utf-8",

	backup = false,
	writebackup = false,
	swapfile = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,

	-- colorcolumn = "80",
	updatetime = 20,
	scrolloff = 0,
	mouse = "a",

	title = true,
	titlestring = "Neovim - %t",
	guifont = "CaskaydiaCove Nerd Font",
	clipboard = "unnamedplus",
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
