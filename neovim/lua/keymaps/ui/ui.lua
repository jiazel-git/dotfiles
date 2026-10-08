-- noice.nvim (plugins/ui/ui.lua)
return {
    {
        "<leader>sN",
        function()
            require("noice").cmd("pick")
        end,
        desc = "[Noice] pick history messages",
    },
    {
        "<leader>N",
        function()
            require("noice").cmd("history")
        end,
        desc = "[Noice] Show history messages",
    },
}
