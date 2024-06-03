return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- lazy = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function ()
		vim.g.lazygit_floating_window_winblend = 50
		-- vim.g.lazygit_floating_window_use_plenary = 1
	end
}
