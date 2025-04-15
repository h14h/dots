return {
	{
		"olimorris/codecompanion.nvim",
		opts = {
			adapters = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						schema = {
							model = {
								default = "gemini-2.5-pro-exp-03-25",
							},
						},
					})
				end,
			},
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
					provider = "telescope",
				},
			},
		},
		config = function(opts)
			require("codecompanion").setup(opts)

			vim.keymap.set("n", "<leader>ai", ":CodeCompanionActions<CR>", { desc = "Open [A][I] Actions Panel" })
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
