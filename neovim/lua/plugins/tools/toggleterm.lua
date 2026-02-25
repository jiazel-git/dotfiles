local _Opts = {}

_Opts.size = 13
_Opts.open_mapping = [[<C-\>]]
_Opts.hide_numbers = true
_Opts.shade_filetypes = {}
_Opts.shade_terminals = true
_Opts.shading_factor = -15
_Opts.start_in_insert = true
_Opts.insert_mappings = true
_Opts.persist_size = true
_Opts.direction = "horizontal"
_Opts.close_on_exit = true
_Opts.shell = vim.o.shell

_Opts.float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
        border = "Normal",
        background = "Normal",
    },
}

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = _Opts,
    keys = require("keymaps.terminal").toggleterm,
}
