return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	opts = {
		transparent = true,
	},
	init = function()
		vim.cmd.colorscheme("kanagawa")
	end,
}
