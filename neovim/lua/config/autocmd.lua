-- 自动检测无扩展名文件的 filetype
--- @diagnostic disable
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    callback = function()
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
    end,
})
