return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		opts = {
			defaults = {
				winblend = 40,
			}
		}
	},
	{
		'nvim-telescope/telescope-symbols.nvim',
		dependencies = 'nvim-telescope/telescope.nvim',
	},
	{
		'nvim-tree/nvim-web-devicons',
		dependencies = 'nvim-telescope/telescope.nvim',
	}
}
