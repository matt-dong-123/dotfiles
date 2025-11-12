return {
    black = 0xff293136,
    white = 0xffd3c6aa,
    red = 0xffe67e80,
    green = 0xff83c092,
    blue = 0xff7fbbb3,
    yellow = 0xffdbbc7f,
    orange = 0xffe69875,
    magenta = 0xffd699b6,
    grey = 0xff555f66,
    transparent = 0x00000000,

    default = 0xff83c092,

    bar = {
        bg = 0x66000000,
    },

    popup = {
        bg = 0xff4d5960,
        border = 0xff555f66,
    },

    bg1 = 0xff333c43,
    bg2 = 0xff3a464c,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
