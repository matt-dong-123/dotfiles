return {
	"gbprod/nord.nvim",
	priority = 1000,
	opts = {
		transparent = true,
	},
	init = function()
		vim.cmd.colorscheme("nord")
	end,
}
