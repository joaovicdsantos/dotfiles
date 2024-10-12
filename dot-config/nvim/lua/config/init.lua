-- General Configuration
require("config.options")
require("config.remap")

-- Plugins \o/
require("config.lazy")
require("luasnip.loaders.from_vscode").lazy_load()

vim.cmd([[ set shell=/bin/zsh ]])
