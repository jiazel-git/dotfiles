local set_hl = vim.api.nvim_set_hl
local HightLights = {
    Pink = {
        fg = "#F5C2E7",
    },
    Origin = {
        fg = "#F38BA9",
    },
}
set_hl(0, "WhichKeyTitle", HightLights.Pink)
set_hl(0, "NeoTreeFloatTitle", HightLights.Pink)
set_hl(0, "FloatTitle", HightLights.Pink)
set_hl(0, "SnacksPickerPreviewTitle", HightLights.Pink)
set_hl(0, "LineNr", HightLights.Origin)
