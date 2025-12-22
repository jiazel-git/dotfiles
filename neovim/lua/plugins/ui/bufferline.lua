return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
        {
            "<leader>bP",
            "<Cmd>BufferLineGroupClose ungrouped<CR>",
            desc = "Delete Non-Pinned Buffers",
        },
        {
            "<leader>br",
            "<Cmd>BufferLineCloseRight<CR>",
            desc = "Delete Buffers to the Right",
        },
        {
            "<leader>bl",
            "<Cmd>BufferLineCloseLeft<CR>",
            desc = "Delete Buffers to the Left",
        },
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
        { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
        { "<leader>bd", "<Cmd>bdelete<CR>", desc = "Delete Buuffer" },
        {
            "<leader>b1",
            "<Cmd>BufferLineGoToBuffer 1<CR>",
            desc = "GoToBuffer1",
        },
        {
            "<leader>b2",
            "<Cmd>BufferLineGoToBuffer 2<CR>",
            desc = "GoToBuffer2",
        },
        {
            "<leader>b3",
            "<Cmd>BufferLineGoToBuffer 3<CR>",
            desc = "GoToBuffer3",
        },
        {
            "<leader>b4",
            "<Cmd>BufferLineGoToBuffer 4<CR>",
            desc = "GoToBuffer4",
        },
        {
            "<leader>b5",
            "<Cmd>BufferLineGoToBuffer 5<CR>",
            desc = "GoToBuffer5",
        },
        {
            "<leader>b6",
            "<Cmd>BufferLineGoToBuffer 6<CR>",
            desc = "GoToBuffer6",
        },
        {
            "<leader>b7",
            "<Cmd>BufferLineGoToBuffer 7<CR>",
            desc = "GoToBuffer7",
        },
        {
            "<leader>b8",
            "<Cmd>BufferLineGoToBuffer 8<CR>",
            desc = "GoToBuffer8",
        },
        {
            "<leader>b9",
            "<Cmd>BufferLineGoToBuffer 9<CR>",
            desc = "GoToBuffer9",
        },
        {
            "<leader>b0",
            "<Cmd>BufferLineGoToBuffer -1<CR>",
            desc = "GoToLastBuffer",
        },
    },
    opts = {
        options = {
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
                local icons = {
                    error = "✘",
                    warning = "▲",
                    info = "⚑",
                    hint = "»",
                }
                local ret = {}
                for type, icon in pairs(icons) do
                    if
                        diagnostics_dict[type]
                        and diagnostics_dict[type] > 0
                    then
                        table.insert(ret, icon .. diagnostics_dict[type])
                    end
                end
                return ret
            end,
        },
    },
    config = function(_, opts)
        opts.highlights = require("catppuccin.special.bufferline").get_theme()
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
