-- Noice options
local _NoiceOpts = {}

_NoiceOpts.poupmenu = {
    enable = false,
    backend = "nui",
}

_NoiceOpts.lsp = {
    override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["com.entry.get_documentation"] = true,
    },
    signature = {
        enabled = false,
    },
}

_NoiceOpts.views = {
    cmdline_popup = {
        position = {
            row = 3,
            col = "50%",
        },
        size = {
            width = 60,
            height = "auto",
        },
    },
    mini = {},
}

_NoiceOpts.cmdline = {
    enabled = true,
    view = "cmdline_popup",
}

-- LazyDev options
local _LazyDevOpts = {}

_LazyDevOpts.library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
}

return {
    -- noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = _NoiceOpts,
        keys = require("keymaps.ui").noice,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        presets = {
            bottom_search = false,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
        routes = {
            {
                filter = { event = "msg_show", kind = "search_count" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "" },
                opts = { skip = true },
            },
        },
    },

    -- lazydev
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = _LazyDevOpts,
    },
}
