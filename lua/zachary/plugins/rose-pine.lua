return {
	"rose-pine/neovim", name = "rose-pine",
	lazy = false,
	opts = {
		variant = "auto",
		dark_variant = "moon",
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},
	}
}
