return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    --lazy = true,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            json = { "prettier" },
            css = { "prettier" },
            cmake = { "cmakelang" },
            python = { "ruff_format" },
            typescript = { "prettier" },
            rust = { "rustfmt" },
            bash = { "shfmt" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
