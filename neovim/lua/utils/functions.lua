local M = {}

-- 源文件/头文件扩展名映射
local source_exts = { ".cpp", ".cc", ".c", ".cxx" }
local header_exts = { ".h", ".hpp", ".hxx" }

function M.switch_source_header()
    -- 优先使用 clangd 的内置命令
    local clients = vim.lsp.get_clients({ bufnr = 0, name = "clangd" })
    if #clients > 0 then
        vim.cmd("ClangdSwitchSourceHeader")
        return
    end

    -- 手动切换
    local current = vim.api.nvim_buf_get_name(0)
    if not current or current == "" then
        return
    end

    local base = current:match("(.+)%.[^.]+$")
    if not base then
        return
    end

    local target_exts

    -- 判断当前是源文件还是头文件
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

    -- 尝试找到目标文件
    for _, target_ext in ipairs(target_exts) do
        local target = base .. target_ext
        if vim.fn.filereadable(target) == 1 then
            vim.cmd("edit " .. target)
            return
        end
    end
end

return M
