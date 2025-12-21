-- 自动检测文件内容并设置 filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*", -- 对所有文件生效
    callback = function()
        -- 只对尚未设置 filetype 的文件处理（避免覆盖）
        if vim.bo.filetype ~= "" then
            return
        end

        -- 读取文件前 10 行
        local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
        for _, line in ipairs(lines) do
            -- 去除前后空白
            local trimmed = line:match("^%s*(.-)%s*$")
            if trimmed ~= "" then
                -- 如果以 { 或 [ 开头，很可能是 JSON
                if trimmed:match("^[{[]") then
                    vim.bo.filetype = "jsonc"
                end
                break -- 只检查第一行非空内容
            end
        end
    end,
})
