local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- 约定：每个 import 对应一个目录，目录顶层的 .lua 即 lazy spec；
    -- 新增插件子目录需在此追加一行；非 spec 辅助模块放无 init.lua 的子目录（如 lsp/lib/）
    spec = {
        { import = "plugins.core" },
        { import = "plugins.completion" },
        { import = "plugins.format" },
        { import = "plugins.colorscheme" },
        { import = "plugins.editor" },
        { import = "plugins.ui" },
        { import = "plugins.tools" },
        { import = "plugins.git" },
        { import = "plugins.nav" },
        { import = "lsp" },
        -- { import = "ai" }, -- Reserved for AI Workflow layer
    },
    defaults = {
        lazy = true,
        version = false,
    },
    checker = {
        enabled = true,
        notify = false,
    },
    ui = {
        border = "rounded",
        backdrop = 100,
    },
})
