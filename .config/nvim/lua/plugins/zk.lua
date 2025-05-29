return {
	{
		"zk-org/zk-nvim",
		config = function()
			require("zk").setup({
				picker = "select",
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
