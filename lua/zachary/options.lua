local options = {
	-- tab settings
	shiftwidth = 2,
	tabstop = 2,

	-- line numbers
	number = true,
	relativenumber = true,

	wrap = true,
	scrolloff = 8,
	clipboard = "unnamedplus",


	fileencoding = 'utf-8',
	ignorecase = true,
	termguicolors = true,

	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,

	secure = true,
	exrc = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- key map leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","
