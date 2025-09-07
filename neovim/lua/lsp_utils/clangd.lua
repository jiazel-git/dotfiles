return {
    clangd = {
        capabilities = {
            offsetEncoding = { "utf-16" },
        },
        cmd = {
            "clangd",
            "--header-insertion=iwyu",
        },
    },
}
