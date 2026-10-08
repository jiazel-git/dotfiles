-- which-key.nvim (plugins/tools/which-key.lua)
return {
    {
        "?",
        function()
            require("which-key").show()
        end,
        desc = "Show all Keymaps",
    },
}
