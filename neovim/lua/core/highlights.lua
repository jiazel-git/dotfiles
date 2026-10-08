local M = {}

M.definitions = {
    Pink = {
        fg = "#F5C2E7",
    },
    Origin = {
        fg = "#F38BA9",
    },
}

--- 设置自定义高亮效果
-- 覆盖默认的高亮配置，设置透明背景和自定义颜色
function M.set()
    local set_hl = vim.api.nvim_set_hl
    local defs = M.definitions

    set_hl(0, "Winbar", { bg = "NONE" })
    set_hl(0, "WinbarNC", { bg = "NONE" })
    set_hl(0, "LspInlayHint", { bg = "NONE" })
    set_hl(0, "Pmenu", { bg = "NONE" })
    set_hl(0, "PmenuSbar", { bg = "NONE" })
    set_hl(0, "PmenuThumb", { bg = "NONE" })
    set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#0db9d7", bg = "NONE" })
    set_hl(0, "DiagnosticVirtualTextError", { fg = "#c53b53", bg = "NONE" })
    set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#ffc777", bg = "NONE" })
    set_hl(0, "DiagnosticVirtualTextHint", { fg = "#828bb8", bg = "NONE" })
    set_hl(0, "WhichKeyTitle", defs.Pink)
    set_hl(0, "NeoTreeFloatTitle", defs.Pink)
    set_hl(0, "FloatTitle", defs.Pink)
    set_hl(0, "SnacksPickerPreviewTitle", defs.Pink)
    set_hl(0, "LineNr", defs.Origin)

    local has_tokyonight = pcall(require, "tokyonight")
    if has_tokyonight then
        set_hl(0, "@markup.heading.1.markdown", { fg = "#82aaff", bg = "NONE" })
        set_hl(0, "@markup.raw.markdown_inline", { fg = "#82aaff", bg = "NONE" })
        set_hl(0, "@markup.heading.2.markdown", { fg = "#ffc777", bg = "NONE" })
        set_hl(0, "@markup.heading.3.markdown", { fg = "#c3e88d", bg = "NONE" })
        set_hl(0, "@markup.heading.4.markdown", { fg = "#4fd6be", bg = "NONE" })
        set_hl(0, "@markup.heading.5.markdown", { fg = "#c099ff", bg = "NONE" })
        set_hl(0, "@markup.heading.6.markdown", { fg = "#fca7ea", bg = "NONE" })
        set_hl(0, "@markup.heading.7.markdown", { fg = "#ff966c", bg = "NONE" })
        set_hl(0, "RenderMarkdownCode", { bg = "NONE" })

        -- render-markdown.nvim 高亮组
        for i = 1, 6 do
            set_hl(0, string.format("RenderMarkdownH%dBg", i), { bg = "NONE" })
        end
    end
end

return M
