require("yaziline"):setup({
	color = "#7aa2f7",
	separator_style = "liney",
})

require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

require("relative-motions"):setup({ show_numbers = "relative_absolute", show_motion = true })

require("git"):setup()

THEME.git = THEME.git or {}
THEME.git.modified_sign = "M"
THEME.git.deleted_sign = "D"
THEME.git.added_sign = "A"
THEME.git.untracked_sign = "?"
THEME.git.updated_sign = "U"
THEME.git.ignored_sign = "I"
