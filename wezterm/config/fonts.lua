local wezterm = require('wezterm')
local platform = require('utils.platform')

-- local font = 'Maple Mono SC NF' JetBrainsMono Nerd Font
local font_family = 'Maple Mono NF CN'
local font_size = platform.is_mac and 12 or 11

return {
    font = wezterm.font({
        family = font_family,
        style = 'Italic',
    }),
    font_size = font_size,

    freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
    freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
