return {
    black = 0xff282828,
    white = 0xffebdbb2,
    red = 0xffcc241d,
    green = 0xff8ec07c,
    blue = 0xff83a598,
    yellow = 0xfffabd2f,
    orange = 0xfffe8019,
    magenta = 0xffd3869b,
    grey = 0xffa89984,
    transparent = 0x00000000,

    default = 0xff83a598,

    bar = {
        bg = 0x66000000,
    },

    popup = {
        bg = 0xc0a89984,
        border = 0xffd3869b,
    },

    bg1 = 0xffa89984,
    bg2 = 0xffa89984,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
