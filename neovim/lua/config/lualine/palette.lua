-- Lualine color palette based on Tokyo Night
local M = {}

function M.get()
    local style = require("tokyonight.config").options.style
    local C = require("tokyonight.colors").setup({ style = style })

    return {
        -- Base colors
        BG = "NONE",
        FG = C.fg,

        -- Accent colors
        YELLOW = C.yellow,
        CYAN = C.cyan,
        DARKBLUE = C.blue0,
        GREEN = C.green,
        ORANGE = C.orange,
        VIOLET = C.magenta,
        MAGENTA = C.purple,
        BLUE = C.blue,
        RED = C.red,

        -- Extra tokyonight colors
        SKY = C.blue2,
        LAVENDER = C.blue1,
        FLAMINGO = C.magenta2,
        ROSEWATER = C.red,
        MAROON = C.red1,

        -- Surface colors
        BASE = C.black,
        MANTLE = C.bg_dark,
        CRUST = C.bg_dark1,
        SURFACE0 = C.bg_dark,
        SURFACE1 = C.bg_highlight,
        SURFACE2 = C.terminal_black,
        OVERLAY0 = C.comment,
        OVERLAY1 = C.dark5,
        OVERLAY2 = C.dark3,
        SUBTEXT0 = C.fg_dark,
        SUBTEXT1 = C.comment,
        TEXT = C.fg,
    }
end

return M
