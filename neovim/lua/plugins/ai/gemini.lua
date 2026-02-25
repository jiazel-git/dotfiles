local _Opts = {}

_Opts.split_direction = "vertical"

return {
    "jonroosevelt/gemini-cli.nvim",
    cmd = "Gemini",
    config = function()
        require("gemini").setup(_Opts)
    end,
}
