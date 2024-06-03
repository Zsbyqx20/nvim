return {
	'lewis6991/gitsigns.nvim',
	enabled = vim.fn.executable "git" == 1,
	event = "InsertEnter",
	config = function ()
		require('gitsigns').setup{}
	end
}
