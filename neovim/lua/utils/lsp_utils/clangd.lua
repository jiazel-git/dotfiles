return {
    clangd = {
        capabilities = {
            offsetEncoding = { "utf-8", "utf-16" },
        },
        cmd = {
            "clangd",
            "--header-insertion=iwyu",
        },
    },
}
