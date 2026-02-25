local _Opts = {}

_Opts.formatters_by_ft = {
    lua = { "stylua" },
    json = { "prettier" },
    css = { "prettier" },
    cmake = { "cmakelang" },
    python = { "ruff_format" },
    typescript = { "prettier" },
    rust = { "rustfmt" },
    bash = { "shfmt" },
}

_Opts.format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
}

return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    dependencies = { "mason.nvim" },
    opts = _Opts,
}
