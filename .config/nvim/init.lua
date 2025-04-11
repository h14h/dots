vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("core.options")
require("core.keymaps")
require("core.autocommands")

require("lsp.configs")
require("lsp.autocommands")
require("lsp.diagnostics")

require("core.lazy")

require("lazy").setup({
	"tpope/vim-sleuth",
	"tpope/vim-fugitive",
	{ import = "plugins" },

	---@diagnostic disable-next-line: missing-fields
}, {
	ui = {
		border = "rounded",
	},
})

-- vim: ts=2 sts=2 sw=2 et
