return {
	black = 0xff1f2335,
	white = 0xffc0caf5,
	red = 0xffff757f,
	green = 0xff4fd6be,
	blue = 0xff7aa2f7,
	yellow = 0xffffc777,
	orange = 0xffff9e64,
	magenta = 0xff9d7cd8,
	grey = 0xff544c7e,
	transparent = 0x00000000,

	default = 0xff7aa2f7,

	bar = {
		bg = 0xaa1f2335,
		border = 0xff4fd6be,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	bg1 = 0xff363944,
	bg2 = 0xff414550,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
