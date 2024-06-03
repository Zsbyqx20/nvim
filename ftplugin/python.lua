-- Configurations for Python filetype

-- key mapping
local wk = require("which-key")

wk.register({
	v = { name = "+ Venv" },
}, { prefix = "<localleader>" })

vim.keymap.set("n", "<localleader>a", require("zachary.pdm_venv").configure_venv, { desc = "Activate Venv (PDM)" })
vim.keymap.set("n", "<localleader>va", require("zachary.pdm_venv").configure_venv, { desc = "Activate Venv (PDM)" })
