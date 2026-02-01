local M = {}

-- toggleterm.nvim
M.toggleterm = {
    {
        "<C-\\>",
        function()
            require("toggleterm").toggle()
        end,
        desc = "Toggle Terminal",
    },
    {
        "<leader>tf",
        function()
            require("toggleterm").toggle(nil, nil, nil, "float")
        end,
        desc = "Float Terminal",
    },
    {
        "<leader>th",
        function()
            require("toggleterm").toggle(nil, 10, nil, "horizontal")
        end,
        desc = "Horizontal Terminal",
    },
    {
        "<leader>tv",
        function()
            require("toggleterm").toggle(nil, 80, nil, "vertical")
        end,
        desc = "Vertical Terminal",
    },
}

return M
