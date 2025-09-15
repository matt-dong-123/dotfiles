return {
	"neanias/everforest-nvim",
	priority = 1000,
	opts = {
		transparent_background_level = 2,
	},
	config = function()
		vim.cmd.colorscheme("everforest")
	end,
}
