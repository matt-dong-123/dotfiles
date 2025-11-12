return {
    black = 0xff282a36,
    white = 0xfff8f8f2,
    red = 0xffff5555,
    green = 0xff50fa7b,
    blue = 0xff8be9fd,
    yellow = 0xfff1fa8c,
    orange = 0xffffb86c,
    magenta = 0xffbd93f9,
    grey = 0xff6272a4,
    transparent = 0x00000000,

    default = 0xff8be9fd,

    bar = {
        bg = 0x66000000,
    },

    popup = {
        bg = 0xc044475a,
        border = 0xff6272a4,
    },

    bg1 = 0xff44475a,
    bg2 = 0xff44475a,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
