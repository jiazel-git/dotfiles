local _Opts = {}

_Opts.ls = {
    lua_ls = {
        arguments_hl = "@comment",
    },
    gopls = {
        align_type_to_right = true,
        add_colon_before_type = false,
        preserve_type_when_truncate = true,
    },
    clangd = {
        extra_info_hl = "@comment",
        align_type_to_right = true,
        import_dot_hl = "@comment",
        preserve_type_when_truncate = true,
    },
    pylsp = {
        extra_info_hl = "@comment",
        arguments_hl = "@comment",
    },
    fallback = true,
    fallback_extra_info_hl = "@comment",
}

_Opts.fallback_highlight = "@variable"
_Opts.max_width = 60

return {
    "xzbdmw/colorful-menu.nvim",
    config = function()
        require("colorful-menu").setup(_Opts)
    end,
}
