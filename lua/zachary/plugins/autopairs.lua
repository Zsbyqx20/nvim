return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")
		local cond = require("nvim-autopairs.conds")
		local ts_conds = require("nvim-autopairs.ts-conds")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- treesitter compatible
		npairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
			fast_wrap = {
				map = "<M-e>",
			},
		})

		npairs.add_rules({
			Rule("\\(", "\\)", "tex"),
		})
	end,
}
