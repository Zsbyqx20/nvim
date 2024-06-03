require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
	},
})
require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "black", "selene" },
	automatic_installation = true,
	handlers = {},
})
require("null-ls").setup({
	sources = {},
})
require("mason-nvim-dap").setup({
	ensure_installed = { "python" },
	automatic_installation = true,
})
-- require("dapui").setup()

-- require("neodev").setup({
-- 	-- library = { plugins = { "nvim-dap-ui" }, types = true },
-- })

local lspconfig = require("lspconfig")
-- local lua_ls_settings = require("zachary.lsp.lua_ls")

-- lspconfig.lua_ls.setup(lua_ls_settings)
-- lspconfig.lua_ls.setup({
-- 	settings = {
-- 		Lua = {
-- 			completion = {
-- 				callSnippet = "Replace"
-- 			}
-- 		}
-- 	}
-- })
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
