return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	-- { "folke/neodev.nvim",                opts = {} },
	{
		"folke/lazydev.nvim",
		ft = "lua",
		-- dependencies = { "Bilal2453/luvit-meta", lazy = true },
		opts = {
			library = {
				-- "luvit-meta/library",
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		main = "null-ls",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
			},
		},
		event = { "BufReadPre", "BufNewFile" },
	},
	-- dap plugins
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			local dap = require("dap")
			dap.adapters.python = function(cb, config)
				if config.request == "attach" then
					---@diagnostic disable-next-line: undefined-field
					local port = (config.connect or config).port
					---@diagnostic disable-next-line: undefined-field
					local host = (config.connect or config).host or "127.0.0.1"
					cb({
						type = "server",
						port = assert(port, "`connect.port` is required for a python `attach` configuration"),
						host = host,
						options = { source_filetype = "python" },
					})
				else
					cb({
						type = "executable",
						command = "/Users/zachary/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
						args = { "-m", "debugpy.adapter" },
						options = {
							source_filetype = "python",
						},
					})
				end
			end

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch File",
					program = "${file}",
					pythonPath = function()
						local virtual_env = os.getenv("VIRTUAL_ENV")
						if virtual_env then
							return virtual_env .. "/bin/python"
						else
							return "python3"
						end
					end,
				},
			}
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
		cmd = { "DapInstall", "DapUninstall" },
	},
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	lazy = true,
	-- 	dependencies = {
	-- 		{ "nvim-neotest/nvim-nio", lazy = true },
	-- 		{ "mfussenegger/nvim-dap", lazy = true },
	-- 	},
	-- 	opts = { floating = { border = "rounded" } },
	-- 	config = function()
	-- 		local dap, dapui = require("dap"), require("dapui")
	-- 		dap.listeners.before.attach.dapui_config = function() dapui.open() end
	-- 		dap.listeners.before.launch.dapui_config = function() dapui.open() end
	-- 		dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
	-- 		dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
	-- 	end,
	-- },
	{
		"rcarriga/cmp-dap",
		lazy = true,
		dependencies = { "hrsh7th/nvim-cmp" },
	},
}
