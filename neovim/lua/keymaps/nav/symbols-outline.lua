-- symbols-outline.nvim (plugins/nav/symbols-outline.lua)
return {
    {
        "<leader>cS",
        function()
            require("symbols-outline").toggle_outline()
        end,
        desc = "Symbols Outline",
    },
}
