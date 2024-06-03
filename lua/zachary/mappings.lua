local wk = require("which-key")
local ts = require("telescope.builtin")
local gitsigns = require("gitsigns")
local dap = require("dap")
local duw = require("dap.ui.widgets")

wk.register({
	f = {
		name = "+ Find",
		f = { function() ts.find_files() end, "Find files" },
		g = { function() ts.live_grep() end, "Find words in all files" },
		b = { function() ts.buffers() end, "Find buffers" },
		h = { function() ts.help_tags() end, "Find help tags" },
		c = {
			function() ts.find_files({ prompt_title = "Config Files", cwd = vim.fn.stdpath("config"), follow = true }) end,
			"Find help tags",
		},
		a = { function() ts.find_files({ hidden = true, no_ignore = true }) end, "Find all files" },
		k = { function() ts.keymaps() end, "Find keymaps" },
		r = { function() ts.oldfiles() end, "Find Recent" },
	},
	g = {
		name = "+󰊢 Git",
		g = { "<cmd>LazyGit<cr>", "LazyGit" },
	},
	w = { "<cmd>:w<cr>", "Save File" },
	q = { "<cmd>:q<cr>", "Quit" },
	e = { "<cmd>:so<cr>", "Source Current File" },
	n = { "<cmd>:enew<cr>", "Create a new file" },
	t = { name = "+ Terminal" },
	b = { name = "+ Windows & Buffers" },
}, { prefix = "<leader>" })

wk.register({
	d = { name = "+ Dap" },
	l = { name = "+ LSP" },
}, { prefix = "<localleader>" })

-- general mapping
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous Buffer", silent = true })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer", silent = true })
vim.keymap.set("i", "<C-l>", require("zachary.utils").EscapePair, { desc = "Escape Pair", silent = true })

-- gitsigns mapping
vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage Git Hunk" })
vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Git Hunk" })
vim.keymap.set(
	"v",
	"<leader>gs",
	function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
	{ desc = "Stage Git Hunk" }
)
vim.keymap.set(
	"v",
	"<leader>gr",
	function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
	{ desc = "Reset Git Hunk" }
)
vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage Git Buffer" })
vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo Git Hunk" })
vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset Git Buffer" })
vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Git Hunk" })
vim.keymap.set("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, { desc = "View Full Git Blame" })
vim.keymap.set("n", "<leader>gl", gitsigns.toggle_current_line_blame, { desc = "View Current Line Git Blame" })

-- lsp mapping
vim.keymap.set("n", "<localleader>li", ts.lsp_implementations, { desc = "Goto Implementation" })
vim.keymap.set("n", "<localleader>ld", ts.lsp_definitions, { desc = "Goto Definition" })
vim.keymap.set("n", "<localleader>lt", ts.lsp_type_definitions, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<localleader>f", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format Buffer" })

-- toggleterm mapping
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })

-- dap mapping
vim.keymap.set("n", "<localleader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start Debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over Current Entry" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into Current Entry" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out Current Entry" })
vim.keymap.set("n", "<localleader>do", dap.repl.open, { desc = "Open Dap Repl" })
vim.keymap.set("n", "<localleader>dh", duw.hover, { desc = "Hover" })
vim.keymap.set("n", "<localleader>dp", duw.preview, { desc = "Preview" })
vim.keymap.set("n", "<localleader>df", function() duw.centered_float(duw.frames) end, { desc = "Toggle Float Frames" })
vim.keymap.set("n", "<localleader>ds", function() duw.centered_float(duw.scopes) end, { desc = "Toggle Float Scopes" })
