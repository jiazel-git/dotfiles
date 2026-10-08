-- snacks.nvim 汇总入口
-- 有自定义配置的模块：每个模块一个文件
local configured = {
    "animate",
    "dashboard",
    "explorer",
    "indent",
    "notifier",
    "picker",
}

-- snacks 推荐开启、无需额外配置的模块（列入 opts 即启用）
local default_enabled = {
    "bigfile",
    "input",
    "quickfile",
    "scope",
    "scroll",
    "statuscolumn",
    "words",
}

local opts = {}
for _, name in ipairs(configured) do
    opts[name] = require("plugins.core.snacks." .. name)
end
for _, name in ipairs(default_enabled) do
    opts[name] = {}
end

return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = opts,
        keys = require("keymaps.core.snacks"),
    },
}
