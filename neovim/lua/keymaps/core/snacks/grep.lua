-- snacks.picker: grep
return {
    {
        "<leader>sB",
        function()
            require("snacks.picker").grep_buffers()
        end,
        desc = "Grep Open Buffers",
    },
    {
        "<leader>sb",
        function()
            require("snacks.picker").lines()
        end,
        desc = "Buffer Lines",
    },
    {
        "<leader>sg",
        function()
            require("snacks.picker").grep()
        end,
        desc = "Grep",
    },
}
