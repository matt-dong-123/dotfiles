return {
    black = 0xff282828,
    white = 0xffddc7a1,
    red = 0xffea6962,
    green = 0xffa9b665,
    blue = 0xff7daea3,
    yellow = 0xffd8a657,
    orange = 0xffe78a4e,
    magenta = 0xffd3869b,
    grey = 0xff7c6f64,
    transparent = 0x00000000,

    default = 0xff7daea3,

    bar = {
        bg = 0x66000000,
    },

    popup = {
        bg = 0xc02d4f67,
        border = 0xff928374,
    },

    bg1 = 0xff7c6f64,
    bg2 = 0xff45403d,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
