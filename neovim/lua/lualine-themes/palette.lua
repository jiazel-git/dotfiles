-- Lualine color palette based on Catppuccin
local M = {}

function M.get()
    local C = require("catppuccin.palettes").get_palette()

    return {
        -- Base colors
        BG = "NONE",
        FG = C.text,

        -- Accent colors
        YELLOW = C.yellow,
        CYAN = C.teal,
        DARKBLUE = C.sapphire,
        GREEN = C.green,
        ORANGE = C.peach,
        VIOLET = C.mauve,
        MAGENTA = C.pink,
        BLUE = C.blue,
        RED = C.red,

        -- Extra catppuccin colors
        SKY = C.sky,
        LAVENDER = C.lavender,
        FLAMINGO = C.flamingo,
        ROSEWATER = C.rosewater,
        MAROON = C.maroon,

        -- Surface colors
        BASE = C.base,
        MANTLE = C.mantle,
        CRUST = C.crust,
        SURFACE0 = C.surface0,
        SURFACE1 = C.surface1,
        SURFACE2 = C.surface2,
        OVERLAY0 = C.overlay0,
        OVERLAY1 = C.overlay1,
        OVERLAY2 = C.overlay2,
        SUBTEXT0 = C.subtext0,
        SUBTEXT1 = C.subtext1,
        TEXT = C.text,
    }
end

return M
