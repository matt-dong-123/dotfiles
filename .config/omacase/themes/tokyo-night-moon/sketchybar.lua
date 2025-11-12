return {
    black = 0xff222436,
    white = 0xffc8d3f5,
    red = 0xffff757f,
    green = 0xffc3e88d,
    blue = 0xff82aaff,
    yellow = 0xffffc777,
    orange = 0xffff966c,
    magenta = 0xffc099ff,
    grey = 0xff636da6,
    transparent = 0x00000000,

    default = 0xff82aaff,

    bar = {
        bg = 0x66000000,
    },

    popup = {
        bg = 0xc01e2030,
        border = 0xffc8d3f5,
    },

    bg1 = 0xff1e2030,
    bg2 = 0xff191b29,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
