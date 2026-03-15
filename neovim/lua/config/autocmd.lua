local functions = require("utils.functions")

-- 自动检测无扩展名文件的 filetype
--- @diagnostic disable
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    callback = functions.check_file_type,
})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    pattern = "*",
    callback = functions.set_highlight,
})
