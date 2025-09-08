return {
	"catppuccin/nvim",
	name = "catppuccin.nvim",
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		float = {
			transparent = true,
		},
	},
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
