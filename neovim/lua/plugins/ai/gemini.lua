return {
    "jonroosevelt/gemini-cli.nvim",
    cmd = "Gemini",
    config = function()
        require("gemini").setup({
            split_direction = "vertical",
        })
    end,
}
