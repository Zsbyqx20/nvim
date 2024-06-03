-- neovide.lua
-- This file contains configurations for neovide GUI.

if vim.g.neovide then
	-- vim.o.guifont = "FiraCode Nerd Font Mono,PingFang SC:h14"
	-- vim.o.guifont = "UbuntuMono Nerd Font,PingFang SC:h16"
	vim.o.guifont = "RecMonoSmCasual Nerd Font Mono,PingFang SC:h15"
	-- English examples, 中文例子
	vim.opt.linespace = 6

	-- for neovide, change the startup directory to user home
	local neovide_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })
	vim.api.nvim_create_autocmd("VimEnter", {
		group = neovide_enter_group,
		pattern = "*",
		callback = function() vim.api.nvim_set_current_dir(tostring(vim.fn.stdpath('config'))) end,
	})

	local options = {
		neovide_scale_factor = 1.0,
		neovide_text_gamma = 0.0,
		neovide_text_contrast = 0.5,

		neovide_padding_top = 20,
		neovide_padding_bottom = 20,
		neovide_padding_right = 20,
		neovide_padding_left = 20,

		neovide_transparency = 0.85,
		neovide_window_blurred = true,
		neovide_floating_blur_amount_x = 0,
		neovide_floating_blur_amount_y = 0,

		experimental_layer_grouping = true,

		neovide_floating_shadow = false,
		neovide_show_border = true,

		neovide_theme = "auto",
		neovide_refresh_rate = 120,

		neovide_input_macos_option_key_is_meta = "both",
		neovide_input_ime = true,

		neovide_cursor_antialiasing = true,
		neovide_cursor_vfx_mode = "railgun",
	}
	for k, v in pairs(options) do
		vim.g[k] = v
	end

	-- clipboard settings
end
