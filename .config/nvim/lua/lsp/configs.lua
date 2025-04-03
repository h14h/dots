vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	log_level = 2,
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
}

vim.lsp.config.denols = {
	cmd = { "deno", "lsp" },
	cmd_env = { NO_COLOR = true },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = function(_, callback)
		local root_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" })

		if root_dir then
			callback(root_dir)
		end
	end,
}

vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = function(_, callback)
		local deno_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" })
		local root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json" })

		if root_dir and deno_dir == nil then
			callback(root_dir)
		end
	end,
}

local servers = { "lua_ls", "ts_ls", "denols" }

for _, server_name in pairs(servers) do
	vim.lsp.enable(server_name)
end
