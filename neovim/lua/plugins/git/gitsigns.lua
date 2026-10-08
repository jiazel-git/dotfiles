local _Opts = {}

_Opts.signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
}

_Opts.signs_staged = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
}

_Opts.current_line_blame = true

return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = _Opts,
    keys = require("keymaps.git.gitsigns"),
}
