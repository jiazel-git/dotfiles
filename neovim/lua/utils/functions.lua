local M = {}

local high_lights = require("config.highlight")

--! 源文件扩展名列表
local source_exts = { ".cpp", ".cc", ".c", ".cxx" }
--! 头文件扩展名列表
local header_exts = { ".h", ".hpp", ".hxx" }

--!
--! @brief 在源文件和头文件之间切换
--! @details 优先使用 clangd 的内置命令切换，若无 clangd 则手动查找对应文件
--!
function M.switch_source_header()
    --! 优先使用 clangd 的内置命令
    local clients = vim.lsp.get_clients({ bufnr = 0, name = "clangd" })
    if #clients > 0 then
        vim.cmd("ClangdSwitchSourceHeader")
        return
    end

    --! 手动切换
    local current = vim.api.nvim_buf_get_name(0)
    if not current or current == "" then
        return
    end

    local base = current:match("(.+)%.[^.]+$")
    if not base then
        return
    end

    local target_exts

    --! 判断当前是源文件还是头文件
    for _, e in ipairs(source_exts) do
        if current:match(e:gsub("%.", "%%.") .. "$") then
            target_exts = header_exts
            break
        end
    end
    if not target_exts then
        for _, e in ipairs(header_exts) do
            if current:match(e:gsub("%.", "%%.") .. "$") then
                target_exts = source_exts
                break
            end
        end
    end

    if not target_exts then
        return
    end

    --! 尝试找到目标文件
    for _, target_ext in ipairs(target_exts) do
        local target = base .. target_ext
        if vim.fn.filereadable(target) == 1 then
            vim.cmd("edit " .. target)
            return
        end
    end
end

--!
--! @brief 设置自定义高亮效果
--! @details 覆盖默认的高亮配置，设置透明背景和自定义颜色
--!
function M.set_highlight()
    local set_hl = vim.api.nvim_set_hl
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
    set_hl(0, "WhichKeyTitle", high_lights.Pink)
    set_hl(0, "NeoTreeFloatTitle", high_lights.Pink)
    set_hl(0, "FloatTitle", high_lights.Pink)
    set_hl(0, "SnacksPickerPreviewTitle", high_lights.Pink)
    set_hl(0, "LineNr", high_lights.Origin)

    local has_tokyonight, _ = pcall(require, "tokyonight")
    if has_tokyonight then
        set_hl(0, "@markup.heading.1.markdown", { fg = "#82aaff", bg = "NONE" })
        set_hl(
            0,
            "@markup.raw.markdown_inline",
            { fg = "#82aaff", bg = "NONE" }
        )
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

--!
--! @brief 检测文件类型是否为 JSON
--! @details 读取文件前20行，跳过注释和空行，根据首行有效内容判断是否为 JSON
--!
function M.check_file_type()
    --! 已有 filetype 直接跳过
    if vim.bo.filetype ~= "" then
        return
    end

    --! 读取前 20 行，跳过注释找第一行有效内容
    local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
    for _, line in ipairs(lines) do
        local trimmed = line:match("^%s*(.-)%s*$")
        --! 跳过空行和注释
        if
            trimmed ~= ""
            and not trimmed:match("^//")
            and not trimmed:match("^#")
            and not trimmed:match("^/%*")
        then
            --! 以 { 或 [ 开头可能是 JSON
            if trimmed:match("^[{%[]") then
                vim.bo.filetype = "jsonc"
            end
            return
        end
    end
end

return M
