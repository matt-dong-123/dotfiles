local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 40,
	color = colors.bar.bg,
	corner_radius = 30,
	padding_right = 2,
	padding_left = 2,
	position = "top",
})
