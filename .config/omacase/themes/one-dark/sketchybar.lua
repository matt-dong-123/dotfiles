return {
    black = 0xff282c34,
    white = 0xffabb2bf,
    red = 0xffe06c75,
    green = 0xff98c379,
    blue = 0xff61afef,
    yellow = 0xffe5c07b,
    orange = 0xffd19a66,
    magenta = 0xffc678dd,
    grey = 0xff5c6370,
    transparent = 0x00000000,

    default = 0xff61afef,

    bar = {
        bg = 0x66000000,
    },

    popup = {
        bg = 0xc0282c34,
        border = 0xff5c6370,
    },

    bg1 = 0xff21252b,
    bg2 = 0xff1e2127,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
