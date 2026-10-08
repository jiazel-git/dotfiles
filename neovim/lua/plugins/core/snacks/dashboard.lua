math.randomseed(os.time())

local header = require("config.dashboard").header

return {
    enabled = true,
    preset = {
        header = header[math.random(#header)],
    },
}
