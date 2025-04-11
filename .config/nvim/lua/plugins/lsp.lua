return {
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{ -- LSP Installation
		"williamboman/mason.nvim",
		config = true,
		opts = {
			ui = { border = "rounded" },
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
