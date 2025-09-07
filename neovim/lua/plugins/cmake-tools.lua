return {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
    },
    lazy = true,
    init = function()
        -- 可选：按需加载触发（如检测到 CMakeLists.txt）
        local function check_cmake_project()
            if vim.fn.filereadable("CMakeLists.txt") == 1 then
                require("lazy").load({ plugins = { "cmake-tools.nvim" } })
            end
        end
        -- 监听进入文件或目录切换
        vim.api.nvim_create_autocmd(
            "BufEnter",
            { callback = check_cmake_project }
        )
        vim.api.nvim_create_autocmd(
            "DirChanged",
            { callback = check_cmake_project }
        )
    end,
    opts = {
        cmake_compile_commands_options = {
            action = "none", -- available options: soft_link, copy, lsp, none
        },
    },
}
