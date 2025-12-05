return {
    capabilities = {
        offsetEncoding = { "utf-8", "utf-16" },
    },
    cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion=iwyu",
    },
}
