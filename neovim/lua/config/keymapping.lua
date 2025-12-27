local keyset = vim.keymap.set
keyset("i", "<C-h>", "<Left>")
keyset("i", "<C-l>", "<Right>")
keyset("i", "<C-j>", "<Down>")
keyset("i", "<C-k>", "<Up>")
keyset("i", "jj", "<Esc>")

keyset("n", "<C-h>", "<C-w>h")
keyset("n", "<C-l>", "<C-w>l")
keyset("n", "<C-j>", "<C-w>j")
keyset("n", "<C-k>", "<C-w>k")
keyset("n", "<leader>w", ":w")
keyset("n", "<leader>q", ":q")
keyset("n", "<C-n>", ":nohl<CR>")

keyset("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
keyset("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
keyset("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })

keyset("t", "jj", "[[<C-\\><C-n>]]", { desc = "Esc Insert Mode" })
keyset("v", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format File" })
