local M = {}

-- lspconfig keymaps
M.lsp = {
    {
        "K",
        vim.lsp.buf.hover,
        desc = "Hover Documentation",
    },
    --{
    --    "<C-k>",
    --    vim.lsp.buf.signature_help,
    --    desc = "Signature Help",
    --},
    {
        "<space>rn",
        vim.lsp.buf.rename,
        desc = "Rename",
    },
    {
        "<leader>cf",
        function()
            vim.lsp.buf.format({ async = true })
        end,
        desc = "Format File",
        mode = "v",
    },
    {
        "<leader>so",
        function()
            vim.cmd("LspClangdSwitchSourceHeader")
        end,
        desc = "Switch between source/header",
    },
    {
        "<leader>sh",
        function()
            vim.cmd("LspClangdShowSymbolInfo")
        end,
        desc = "Show symbol info",
    },
    {
        "<leader>ca",
        function()
            ---@diagnostic disable-next-line: missing-fields
            vim.lsp.buf.code_action({ context = { only = { "quickfix" } } })
        end,
        desc = "Code Action",
    },
}

return M
