local _Opts = {}

_Opts.options = {
    close_command = "bdelete %d",
    themable = true,
    offsets = {
        {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "center",
        },
        {
            filetype = "snacks_layout_box",
        },
    },
    separator_style = "slant",
    indicator = {
        style = "underline",
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local icons = require("utils.icons").diagnostics_by_name
        local s = ""
        for name, icon in pairs(icons) do
            -- bufferline uses: error, warning, info, hint
            -- icons uses: Error, Warn, Info, Hint
            local key = name == "Warn" and "warning" or name:lower()
            local count = diagnostics_dict[key]
            if count and count > 0 then
                s = s .. " " .. icon .. count
            end
        end
        return s
    end,
}

return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = require("keymaps.buffer").bufferline,
    opts = _Opts,
    config = function(_, opts)
        local has_catppuccin, _ = pcall(require, "catppuccin")
        if has_catppuccin then
            opts.highlights =
                require("catppuccin.special.bufferline").get_theme()
        end
        require("bufferline").setup(opts)
        vim.api.nvim_create_autocmd("BufAdd", {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}
