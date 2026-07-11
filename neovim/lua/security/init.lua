-- Security Layer: 安全与信任边界
-- 配置 vim 安全选项和插件信任策略

return {
    -- 安全相关配置
    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            -- 添加安全相关快捷键分组
            opts.spec = vim.list_extend(opts.spec or {}, {
                { "<leader>S", group = "security" },
            })
        end,
    },
}
