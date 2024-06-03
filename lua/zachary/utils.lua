local M = {}

function M.EscapePair()
	local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local after = line:sub(col + 1, -1)
	local closer_col = #after + 1
	local closer_i = nil
	for i, closer in ipairs(closers) do
		local cur_index, _ = after:find(closer)
		if cur_index and (cur_index < closer_col) then
			closer_col = cur_index
			closer_i = i
		end
	end
	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

function M.FormatOnSave()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ buffer = bufnr })
	if clients and #clients > 0 then
		vim.lsp.buf.format({ async = true, bufnr = bufnr })
	end
	vim.api.nvim_command("write")
end

function M.HyperMap(mode, lhs, rhs, leader, opts)
	local leader_map = {
		[0] = "",
		[1] = "<leader>",
		[2] = "<localleader>",
	}
	opts = opts or {}
	opts.noremap = opts.noremap ~= nil and opts.noremap or true
	opts.silent = opts.silent ~= nil and opts.silent or true
	vim.keymap.set(mode, leader_map[leader or 0] .. lhs, rhs, opts)
end

return M
