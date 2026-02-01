return {
    -- add symbols-outline
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = require("keymaps.lsp").symbols_outline,
        opts = {
            position = "right",
        },
    },
}
