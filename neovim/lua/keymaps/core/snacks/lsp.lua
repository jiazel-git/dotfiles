-- snacks.picker: lsp
return {
    {
        "gd",
        function()
            require("snacks.picker").lsp_definitions()
        end,
        desc = "Goto Definition",
    },
    {
        "gD",
        function()
            require("snacks.picker").lsp_declarations()
        end,
        desc = "Goto Declaration",
    },
    {
        "gr",
        function()
            require("snacks.picker").lsp_references()
        end,
        nowait = true,
        desc = "References",
    },
    {
        "gI",
        function()
            require("snacks.picker").lsp_implementations()
        end,
        desc = "Goto Implementation",
    },
    {
        "gy",
        function()
            require("snacks.picker").lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
    },
    {
        "gai",
        function()
            require("snacks.picker").lsp_incoming_calls()
        end,
        desc = "C[a]lls Incoming",
    },
    {
        "gao",
        function()
            require("snacks.picker").lsp_outgoing_calls()
        end,
        desc = "C[a]lls Outgoing",
    },
    {
        "<leader>ss",
        function()
            require("snacks.picker").lsp_symbols()
        end,
        desc = "LSP Symbols",
    },
    {
        "<leader>sS",
        function()
            require("snacks.picker").lsp_workspace_symbols()
        end,
        desc = "LSP Workspace Symbols",
    },
}
