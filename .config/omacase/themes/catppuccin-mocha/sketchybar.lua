return {
	black = 0xff313244,
	white = 0xfff5e0dc,
	red = 0xfff38ba8,
	green = 0xffa6e3a1,
	blue = 0xff89b4fa,
	yellow = 0xfff9e2af,
	orange = 0xfffab387,
	magenta = 0xffcba6f7,
	grey = 0xffa6adc8,
	transparent = 0x00000000,

	default = 0xff89b4fa,

	bar = {
		bg = 0xff11111b,
	},

	popup = {
		bg = 0xc01e1e2e,
		border = 0xff313244,
	},

	bg1 = 0xff181825,
	bg2 = 0xff11111b,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
