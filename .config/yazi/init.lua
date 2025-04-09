require("yaziline"):setup({
	color = "#7aa2f7",
	separator_style = "liney",
})

require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

require("relative-motions"):setup({ show_numbers = "relative_absolute", show_motion = true })

require("git"):setup()
