-- snacks.nvim 键位汇总（每个分类一个文件）
local keymaps = {}

for _, module in ipairs({ "find", "grep", "search", "lsp", "git" }) do
    vim.list_extend(keymaps, require("keymaps.core.snacks." .. module))
end

return keymaps
