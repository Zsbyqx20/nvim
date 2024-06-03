local M = {}

local function set_virtual_env(env_path)
	vim.fn.setenv("VIRTUAL_ENV", env_path .. "/.venv")
	local new_path = env_path .. "/.venv/bin:" .. vim.fn.getenv("PATH")
	vim.fn.setenv("PATH", new_path)
end

M.configure_venv = function()
	local current_dir = vim.fn.getcwd()
	local project_file = current_dir .. "/pyproject.toml"
	local venv_path = current_dir .. "/.venv"

	if vim.fn.filereadable(project_file) and vim.fn.isdirectory(venv_path) then
		set_virtual_env(current_dir)
	end
end

return M
