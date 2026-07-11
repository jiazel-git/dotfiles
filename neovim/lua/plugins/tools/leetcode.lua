local _Opts = {}

_Opts.cn = {
    enabled = true,
    translator = true,
    translate_problems = true,
}

_Opts.injector = {
    ["cpp"] = {
        imports = function()
            return { "#include <bits/stdc++.h>", "using namespace std;" }
        end,
        after = "int main() {}",
    },
}

return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = _Opts,
}
