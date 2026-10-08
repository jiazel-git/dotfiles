local diagnostics = require("config.icons").diagnostics_by_name

return {
    enabled = true,
    style = "fancy",
    date_format = "%c",
    icons = {
        error = diagnostics.Error,
        warn = diagnostics.Warn,
        info = diagnostics.Info,
    },
}
