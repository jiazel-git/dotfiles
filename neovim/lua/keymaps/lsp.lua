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
        require("utils.functions").switch_source_header,
        desc = "Switch between source/header",
    },
    {
        "<leader>sh",
        function()
            vim.cmd("ClangdShowSymbolInfo")
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

-- symbols-outline.nvim
M.symbols_outline = {
    {
        "<leader>cS",
        function()
            require("symbols-outline").toggle_outline()
        end,
        desc = "Symbols Outline",
    },
}

return M
