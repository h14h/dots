return {
	{
		"olimorris/codecompanion.nvim",
		config = true,
		opts = {
			strategies = {
				chat = {
					adapter = "gemini",
				},
				inline = {
					adapter = "gemini",
					keymaps = {
						accept_change = {
							modes = { n = "ga" },
							description = "Accept the suggested change",
						},
						reject_change = {
							modes = { n = "gr" },
							description = "Reject the suggested change",
						},
					},
				},
			},
			display = {
				action_palette = {
					provider = "mini_pick",
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
