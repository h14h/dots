return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.starter").setup()

			require("mini.ai").setup({ n_lines = 500 })
			require("mini.comment").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()

			require("mini.files").setup()
			require("mini.bracketed").setup()

			require("mini.snippets").setup()
			require("mini.extra").setup()

			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			vim.keymap.set("n", "<leader>-", MiniFiles.open, { desc = "Open File Picker" })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
