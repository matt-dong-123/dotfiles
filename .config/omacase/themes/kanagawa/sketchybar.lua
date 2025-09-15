return {
	black = 0xff090618,
	white = 0xffdcd7ba,
	red = 0xffe82424,
	green = 0xff76946a,
	blue = 0xff7e9cd8,
	yellow = 0xffe6c384,
	orange = 0xffffa066,
	magenta = 0xff957fb8,
	grey = 0xff727169,
	transparent = 0x00000000,

	default = 0xff7e9cd8,

	bar = {
		bg = 0x00000000,
	},

	popup = {
		bg = 0xc02d4f67,
		border = 0xff938aa9,
	},

	bg1 = 0xff727169,
	bg2 = 0xff2d4f67,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
