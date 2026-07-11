local M = {}

local high_lights = require("core.highlight")

--- 在源文件和头文件之间切换
-- 使用 LSP 的 textDocument/switchSourceHeader 方法在对应的源文件和头文件之间切换
-- @param bufnr number 缓冲区编号
-- @param client table LSP 客户端对象
function M.switch_source_header(bufnr, client)
    local method_name = "textDocument/switchSourceHeader"
    ---@diagnostic disable-next-line:param-type-mismatch
    if not client or not client:supports_method(method_name) then
        return vim.notify(
            ("method %s is not supported by any servers active on the current buffer"):format(
                method_name
            )
        )
    end
    local params = vim.lsp.util.make_text_document_params(bufnr)
    ---@diagnostic disable-next-line:param-type-mismatch
    client:request(method_name, params, function(err, result)
        if err then
            error(tostring(err))
        end
        if not result then
            vim.notify("corresponding file cannot be determined")
            return
        end
        vim.cmd.edit(vim.uri_to_fname(result))
    end, bufnr)
end

--- 设置自定义高亮效果
-- 覆盖默认的高亮配置，设置透明背景和自定义颜色
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

--- 检测文件类型是否为 JSON
-- 读取文件前20行，跳过注释和空行，根据首行有效内容判断是否为 JSON
function M.check_file_type()
    -- 已有 filetype 直接跳过
    if vim.bo.filetype ~= "" then
        return
    end

    -- 读取前 20 行，跳过注释找第一行有效内容
    local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
    for _, line in ipairs(lines) do
        local trimmed = line:match("^%s*(.-)%s*$")
        -- 跳过空行和注释
        if
            trimmed ~= ""
            and not trimmed:match("^//")
            and not trimmed:match("^#")
            and not trimmed:match("^/%*")
        then
            -- 以 { 或 [ 开头可能是 JSON
            if trimmed:match("^[{%[]") then
                vim.bo.filetype = "jsonc"
            end
            return
        end
    end
end

return M
