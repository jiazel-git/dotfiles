local M = {}

-- bufferline.nvim
M.bufferline = {
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
    { "<leader>bd", "<Cmd>bdelete<CR>", desc = "Delete Buffer" },
    {
        "<leader>b1",
        "<Cmd>BufferLineGoToBuffer 1<CR>",
        desc = "Go to Buffer 1",
    },
    {
        "<leader>b2",
        "<Cmd>BufferLineGoToBuffer 2<CR>",
        desc = "Go to Buffer 2",
    },
    {
        "<leader>b3",
        "<Cmd>BufferLineGoToBuffer 3<CR>",
        desc = "Go to Buffer 3",
    },
    {
        "<leader>b4",
        "<Cmd>BufferLineGoToBuffer 4<CR>",
        desc = "Go to Buffer 4",
    },
    {
        "<leader>b5",
        "<Cmd>BufferLineGoToBuffer 5<CR>",
        desc = "Go to Buffer 5",
    },
    {
        "<leader>b6",
        "<Cmd>BufferLineGoToBuffer 6<CR>",
        desc = "Go to Buffer 6",
    },
    {
        "<leader>b7",
        "<Cmd>BufferLineGoToBuffer 7<CR>",
        desc = "Go to Buffer 7",
    },
    {
        "<leader>b8",
        "<Cmd>BufferLineGoToBuffer 8<CR>",
        desc = "Go to Buffer 8",
    },
    {
        "<leader>b9",
        "<Cmd>BufferLineGoToBuffer 9<CR>",
        desc = "Go to Buffer 9",
    },
    {
        "<leader>b0",
        "<Cmd>BufferLineGoToBuffer -1<CR>",
        desc = "Go to Last Buffer",
    },
}

return M
