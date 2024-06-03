return {
	"lervag/vimtex",
	ft = { "tex", "bib", },
	lazy = false,
	init = function ()
		vim.g.vimtex_view_method = "skim"
	end,
}
