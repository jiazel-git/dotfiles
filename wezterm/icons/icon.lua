local wezterm = require('wezterm')
local nf = wezterm.nerdfonts

local _M = {}

_M.GLYPH_SCIRCLE_LEFT = nf.ple_left_half_circle_thick --[[  ]]
_M.GLYPH_SCIRCLE_RIGHT = nf.ple_right_half_circle_thick --[[  ]]
_M.GLYPH_CIRCLE = nf.fa_circle --[[  ]]
_M.GLYPH_ADMIN = nf.md_shield_half_full --[[ 󰞀 ]]
_M.GLYPH_LINUX = nf.cod_terminal_linux --[[  ]]
_M.GLYPH_DEBUG = nf.fa_bug --[[  ]]
_M.GLYPH_SEARCH = '🔭'

_M.GLYPH_UNSEEN_NUMBERED_BOX = {
    [1] = nf.md_numeric_1_box_multiple, --[[ 󰼏 ]]
    [2] = nf.md_numeric_2_box_multiple, --[[ 󰼐 ]]
    [3] = nf.md_numeric_3_box_multiple, --[[ 󰼑 ]]
    [4] = nf.md_numeric_4_box_multiple, --[[ 󰼒 ]]
    [5] = nf.md_numeric_5_box_multiple, --[[ 󰼓 ]]
    [6] = nf.md_numeric_6_box_multiple, --[[ 󰼔 ]]
    [7] = nf.md_numeric_7_box_multiple, --[[ 󰼕 ]]
    [8] = nf.md_numeric_8_box_multiple, --[[ 󰼖 ]]
    [9] = nf.md_numeric_9_box_multiple, --[[ 󰼗 ]]
    [10] = nf.md_numeric_9_plus_box_multiple, --[[ 󰼘 ]]
}

_M.GLYPH_UNSEEN_NUMBERED_CIRCLE = {
    [1] = nf.md_numeric_1_circle, --[[ 󰲠 ]]
    [2] = nf.md_numeric_2_circle, --[[ 󰲢 ]]
    [3] = nf.md_numeric_3_circle, --[[ 󰲤 ]]
    [4] = nf.md_numeric_4_circle, --[[ 󰲦 ]]
    [5] = nf.md_numeric_5_circle, --[[ 󰲨 ]]
    [6] = nf.md_numeric_6_circle, --[[ 󰲪 ]]
    [7] = nf.md_numeric_7_circle, --[[ 󰲬 ]]
    [8] = nf.md_numeric_8_circle, --[[ 󰲮 ]]
    [9] = nf.md_numeric_9_circle, --[[ 󰲰 ]]
    [10] = nf.md_numeric_9_plus_circle, --[[ 󰲲 ]]
}

return _M
