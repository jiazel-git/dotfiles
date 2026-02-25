local _Opts = {}

_Opts.cmake_compile_commands_options = {
    action = "none",
}

return {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
    },
    lazy = true,
    init = function()
        local function check_cmake_project()
            if vim.fn.filereadable("CMakeLists.txt") == 1 then
                require("lazy").load({ plugins = { "cmake-tools.nvim" } })
            end
        end
        vim.api.nvim_create_autocmd("BufEnter", { callback = check_cmake_project })
        vim.api.nvim_create_autocmd("DirChanged", { callback = check_cmake_project })
    end,
    opts = _Opts,
}
