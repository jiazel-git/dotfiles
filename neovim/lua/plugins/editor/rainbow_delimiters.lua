local _Opts = {}

return {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    submodules = false,
    main = "rainbow-delimiters.setup",
    opts = _Opts,
}
