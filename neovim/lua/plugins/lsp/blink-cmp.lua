local _Opts = {}

_Opts.keymap = {
    preset = "none",
    ["<S-space>"] = {
        "show",
        "show_documentation",
        "hide_documentation",
    },
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    --["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
}

_Opts.completion = {
    documentation = {
        auto_show = true,
        window = {
            scrollbar = false,
        },
    },
    keyword = {
        range = "prefix",
    },
    ghost_text = {
        enabled = true,
    },
    menu = {
        draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
                label = {
                    text = function(ctx)
                        return require("colorful-menu").blink_components_text(
                            ctx
                        )
                    end,
                    highlight = function(ctx)
                        return require("colorful-menu").blink_components_highlight(
                            ctx
                        )
                    end,
                },
            },
        },
        scrollbar = false,
    },
}

_Opts.signature = {
    enabled = true,
    window = {
        show_documentation = true,
    },
}

_Opts.cmdline = {
    completion = {
        menu = {
            auto_show = true,
        },
    },
}

return {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "rafamadriz/friendly-snippets",
        "xzbdmw/colorful-menu.nvim",
    },
    version = "1.*",
    opts = _Opts,
}
