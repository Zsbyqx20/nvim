-- global key bindings
local wk = require("which-key")
local ts = require("telescope.builtin")
local dap = require("dap")
local duw = require("dap.ui.widgets")
local gitsigns = require("gitsigns")
local opts = { noremap = true, silent = true }

-- definition of keybinding groups
wk.register({
	f = { name = "+ Find" },
	g = { name = "+󰊢 Git" },
	b = { name = "+ Windows & Buffers" },
	t = { name = "+ Terminal" },
	l = { name = "+ LSP" },
	d = { name = "+ Debug" },
}, { prefix = "<leader>" })

-- definition of several frequently-used keybindings
local kbs = {
	{ key = "w",  cmd = require("zachary.utils").FormatOnSave, desc = "Hyper-Save" },
	{ key = "q",  cmd = "<cmd>q<cr>",                          desc = "Quit" },
	{ key = "e",  cmd = "<cmd>so<cr>",                         desc = "Source Current File" },
	{ key = "n",  cmd = "<cmd>enew<cr>",                       desc = "New File" },
	-- { key = "[b", cmd = "<cmd>bprevious<cr>",                  desc = "Previous Buffer" },
	-- { key = "b]", cmd = "<cmd>bnext<cr>",                      desc = "Next Buffer" },
	{ key = "|",  cmd = "<cmd>split<cr>",                      desc = "Split Buffer Horizontally" },
	{ key = "-",  cmd = "<cmd>vsplit<cr>",                     desc = "Split Buffer Vertically" },
	-- { key = "<C-l>", cmd = require("zachary.utils").EscapePair,   desc = "Escape Pair",              mode = "i" },

	-- f group
	{ key = "ff", cmd = function() ts.find_files() end,        desc = "Find files" },
	{ key = "fg", cmd = function() ts.live_grep() end,         desc = "Find words in all files" },
	{ key = "fb", cmd = function() ts.buffers() end,           desc = "Find buffers" },
	{ key = "fh", cmd = function() ts.help_tags() end,         desc = "Find help tags" },
	{
		key = "fc",
		cmd = function() ts.find_files({ prompt_title = "Config Files", cwd = vim.fn.stdpath("config"), follow = true }) end,
		desc = "Find help tags",
	},
	{ key = "fa", cmd = function() ts.find_files({ hidden = true, no_ignore = true }) end, desc = "Find help tags" },
	{ key = "fk", cmd = function() ts.keymaps() end,                                       desc = "Find keymaps" },
	{ key = "fr", cmd = function() ts.oldfiles() end,                                      desc = "Find recent" },
	-- g group
	{ key = "gg", cmd = "<cmd>LazyGit<cr>",                                                desc = "Toggle LazyGit UI" },
	{ key = "gs", cmd = gitsigns.stage_hunk,                                               desc = "Stage Git Hunk" },
	{
		key = "gs",
		cmd = gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }),
		desc = "Stage Git Hunk",
		mode = "v",
	},
	{ key = "gr",    cmd = gitsigns.reset_hunk,                                   desc = "Reset Git Hunk" },
	{
		key = "gr",
		cmd = gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }),
		desc = "Reset Git Hunk",
		mode = "v",
	},
	{ key = "gS",    cmd = gitsigns.stage_buffer,                                 desc = "Stage Git Buffer" },
	{ key = "gu",    cmd = gitsigns.undo_stage_hunk,                              desc = "Undo Git Hunk" },
	{ key = "gR",    cmd = gitsigns.reset_buffer,                                 desc = "Reset Git Buffer" },
	{ key = "gp",    cmd = gitsigns.preview_hunk,                                 desc = "Preview Git Hunk" },
	{ key = "gb",    cmd = function() gitsigns.blame_line({ full = "true" }) end, desc = "View Full Git Blame" },
	{ key = "gl",    cmd = gitsigns.toggle_current_line_blame,                    desc = "View Curren Line Git Blame" },

	-- LSP global group
	{ key = "li",    cmd = ts.lsp_implementations,                                desc = "Goto Implementation" },
	{ key = "ld",    cmd = ts.lsp_definitions,                                    desc = "Goto Definition" },
	{ key = "lt",    cmd = ts.lsp_type_definitions,                               desc = "Goto Type Definition" },

	-- terminal group
	{ key = "tf",    cmd = "<cmd>ToggleTerm direction=float<cr>",                 desc = "Toggle Float Terminal" },
	{ key = "th",    cmd = "<cmd>ToggleTerm size=10 direction=horizontal",        desc = "Toggle Horizontal Terminal" },
	{ key = "tv",    cmd = "<cmd>ToggleTerm size=80 direction=vertical",          desc = "Toggle Vertical Terminal" },
	{ key = "<C-'>", cmd = "<cmd>execute v:count . 'ToggleTerm'<cr>",             desc = "Toggle Float Terminal" },
	{
		key = "<C-'>",
		cmd = "<cmd>ToggleTerm<cr>",
		desc = "Toggle Float Terminal",
		mode = "t",
	},
	{
		key = "<C-'>",
		cmd = "<esc><cmd>ToggleTerm<cr>",
		desc = "Toggle Float Terminal",
		mode = "i",
	},

	-- debug group
	{ key = "db", cmd = dap.toggle_breakpoint,                                    desc = "Toggle Breakpoint" },
	-- { key = "<F5>",  cmd=dap.continue,                                                   desc = "Start Debugging" },
	-- { key = "<F10>", cmd=dap.step_over,                                                  desc = "Step Over" },
	-- { key = "<F11>", cmd=dap.step_into,                                                  desc = "Step Into" },
	-- { key = "<F12>", cmd=dap.step_out,                                                   desc = "Step Out" },
	{ key = "do", cmd = dap.repl.open,                                            desc = "Open Dap Repl" },
	{ key = "dh", cmd = duw.hover,                                                desc = "Hover" },
	{ key = "dp", cmd = duw.hover,                                                desc = "Preview" },
	{ key = "df", cmd = function() duw.centered_float(duw.frames) end,            desc = "Toggle Float Frames" },
	{ key = "ds", cmd = function() duw.centered_float(duw.scopes) end,            desc = "Toggle Float Scopes" },

	-- b group
	{ key = "bd", cmd = "<cmd>bd<cr>",                                            desc = "Delete Buffer" },
	{ key = "bg", cmd = ":exec &bg='light'? 'set bg='dark' : 'set bg=light'<cr>", desc = "Toggle Background" },
}

for _, binding in ipairs(kbs) do
	local mode = binding.mode or "n"
	vim.keymap.set(mode, "<leader>" .. binding.key, binding.cmd, vim.tbl_extend("force", opts, { desc = binding.desc }))
	-- vim.keymap.set(mode, "<leader>" .. binding.key, binding.cmd)
end
