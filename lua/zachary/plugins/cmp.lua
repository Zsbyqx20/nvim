return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-buffer",       lazy = true },
		{ "hrsh7th/cmp-path",         lazy = true },
		{ "hrsh7th/cmp-nvim-lsp",     lazy = true },
		{ "L3MON4D3/LuaSnip",         lazy = true, dependencies = { "rafamadriz/friendly-snippets" } },
		{ "saadparwaiz1/cmp_luasnip", lazy = true },
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		-- dap settings
		cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, { sources = { { name = "dap" } } })

		cmp.setup({
			enabled = function()
				return vim.api.nvim_get_option_value("buftype", { buf = 0 }) ~= "prompt" or require("cmp_dap").is_dap_buffer()
			end,
			snippet = {
				expand = function(args) luasnip.lsp_expand(args.body) end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
			window = {
				completion = cmp.config.window.bordered({
					col_offset = -2,
					side_padding = 0,
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				}),
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true,
				}),
			},
			require("lspconfig")["lua_ls"].setup({
				capabilities = capabilities,
			}),
			require("lspconfig")["pyright"].setup({
				capabilities = capabilities,
			}),
		})
	end,
}
