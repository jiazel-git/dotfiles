local M = {}

M.SEPARATORS = {
    ANGLE_LEFT = "",
    ANGLE_RIGHT = "",
    ROUND_LEFT = "",
    ROUND_RIGHT = "",
    FILLER = "",
}

M.FOLDER = ""
M.BRANCH = " "
M.BRANCH_ALT = ""
M.LSP = " "
M.SEARCH = ""
M.UNIX = ""
M.DOS = ""
M.MAC = ""
M.MODIFIED = " ●"
M.READONLY = " "

M.DIAGNOSTICS = {
    ERROR = "✘",
    WARN = "▲",
    INFO = "⚑",
    HINT = "»",
}

M.diagnostics_by_name = {
    Error = M.DIAGNOSTICS.ERROR,
    Warn = M.DIAGNOSTICS.WARN,
    Info = M.DIAGNOSTICS.INFO,
    Hint = M.DIAGNOSTICS.HINT,
}

M.diagnostics_by_severity = {
    [vim.diagnostic.severity.ERROR] = M.DIAGNOSTICS.ERROR,
    [vim.diagnostic.severity.WARN] = M.DIAGNOSTICS.WARN,
    [vim.diagnostic.severity.INFO] = M.DIAGNOSTICS.INFO,
    [vim.diagnostic.severity.HINT] = M.DIAGNOSTICS.HINT,
}

return M
