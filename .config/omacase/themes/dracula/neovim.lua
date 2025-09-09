return {
	"Mofiqul/dracula.nvim",
	priority = 1000,
	opts = {
		transparent_bg = true,
	},
	init = function()
		vim.cmd.colorscheme("dracula")
	end,
}
