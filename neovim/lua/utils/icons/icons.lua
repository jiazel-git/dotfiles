local M = {}

M.diagnostics_by_name = {
    Error = "✘",
    Warn = "▲",
    Info = "⚑",
    Hint = "»",
}

M.diagnostics_by_severity = {
    [vim.diagnostic.severity.ERROR] = "✘",
    [vim.diagnostic.severity.WARN] = "▲",
    [vim.diagnostic.severity.INFO] = "⚑",
    [vim.diagnostic.severity.HINT] = "»",
}
return M
