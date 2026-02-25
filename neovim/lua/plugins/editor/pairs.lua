local _Opts = {}

_Opts.modes = { insert = true, command = true, terminal = false }
_Opts.skip_next = [=[[%w%%%'%[%"%.%`%$]]=]
_Opts.skip_ts = { "string" }
_Opts.skip_unbalanced = true
_Opts.markdown = true

return {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = _Opts,
    config = function(_, opts)
        require("mini.pairs").setup(opts)
    end,
}
