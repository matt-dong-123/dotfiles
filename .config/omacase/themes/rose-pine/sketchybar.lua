return {
    black = 0xff232136,
    white = 0xffe0def4,
    red = 0xffeb6f92,
    green = 0xff9ccfd8,
    blue = 0xff3e8fb0,
    yellow = 0xfff6c177,
    orange = 0xffea9a97,
    magenta = 0xffc4a7e7,
    grey = 0xff6e6a86,
    transparent = 0x00000000,

    default = 0xffc4a7e7,

    bar = {
        bg = 0x00000000,
    },

    popup = {
        bg = 0xc0232136,
        border = 0xff393552,
    },

    bg1 = 0xff2a273f,
    bg2 = 0xff6e6a86,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
