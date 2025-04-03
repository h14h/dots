return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.starter").setup()
			require("mini.notify").setup({
				window = {
					winblend = 0,
				},
			})

			require("mini.ai").setup({ n_lines = 500 })
			require("mini.comment").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()

			require("mini.pick").setup()
			require("mini.files").setup()
			require("mini.bracketed").setup()

			require("mini.git").setup()
			require("mini.snippets").setup()

			require("mini.icons").setup()
			require("mini.extra").setup()

			local builtin = MiniPick.builtin
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>sh", builtin.help, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sf", builtin.files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sw", builtin.grep, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.grep_live, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })

			vim.keymap.set("n", "<leader>-", MiniFiles.open, { desc = "File Explorer" })

			local trigger_cli_input = function()
				vim.ui.input({ prompt = "Command: " }, function(cmd)
					builtin.cli({ command = vim.split(cmd, " ") })
				end)
			end

			vim.keymap.set("n", "<leader>sx", trigger_cli_input, { desc = "[S]earch E[x]ecutable Output" })

			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

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
