local wezterm = require('wezterm')
local colors = require('colors.custom')

math.randomseed(os.time())
math.random()
math.random()
math.random()

local GLOB_PATTERN = '*.{jpg,jpeg,png,gif,bmp,ico,tiff,pnm,dds,tga}'

---@class BackDrops
---@field current_idx number index of current image
---@field images string[] background images
---@field images_dir string directory of background images. Default is `wezterm.config_dir .. '/backdrops/'`
---@field focus_color string background color when in focus mode. Default is `colors.custom.background`
---@field focus_on boolean focus mode on or off
local BackDrops = {}
BackDrops.__index = BackDrops

--- Initialise backdrop controller
---@private
function BackDrops:init()
    local inital = {
        current_idx = 1,
        images = {},
        images_dir = wezterm.config_dir .. '/backdrops/',
        focus_color = colors.background,
        focus_on = false,
    }
    local backdrops = setmetatable(inital, self)
    return backdrops
end

---@param path string directory of background images
function BackDrops:set_images_dir(path)
    self.images_dir = path
    if not path:match('/$') then
        self.images_dir = path .. '/'
    end
    return self
end

function BackDrops:set_images()
    self.images = wezterm.glob(self.images_dir .. GLOB_PATTERN)
    return self
end

---@param focus_color string
function BackDrops:set_focus(focus_color)
    self.focus_color = focus_color
    return self
end

---@private
---@return table
function BackDrops:_create_opts()
    return {
        {
            source = { File = self.images[self.current_idx] },
            horizontal_align = 'Center',
        },
        {
            source = { Color = colors.background },
            height = '120%',
            width = '120%',
            vertical_offset = '-10%',
            horizontal_offset = '-10%',
            opacity = 0.96,
        },
    }
end

---@private
---@return table
function BackDrops:_create_focus_opts()
    return {
        {
            source = { Color = self.focus_color },
            height = '120%',
            width = '120%',
            vertical_offset = '-10%',
            horizontal_offset = '-10%',
            opacity = 1,
        },
    }
end

---@param focus_on boolean?
function BackDrops:initial_options(focus_on)
    focus_on = focus_on or false
    assert(type(focus_on) == 'boolean', 'BackDrops:initial_options - Expected a boolean')

    self.focus_on = focus_on
    if focus_on then
        return self:_create_focus_opts()
    end

    return self:_create_opts()
end

---@private
---@param window any
---@param background_opts table
function BackDrops:_set_opt(window, background_opts)
    window:set_config_overrides({
        background = background_opts,
        enable_tab_bar = window:effective_config().enable_tab_bar,
    })
end

---@private
---@param window any
function BackDrops:_set_focus_opt(window)
    local opts = {
        background = {
            {
                source = { Color = self.focus_color },
                height = '120%',
                width = '120%',
                vertical_offset = '-10%',
                horizontal_offset = '-10%',
                opacity = 1,
            },
        },
        enable_tab_bar = window:effective_config().enable_tab_bar,
    }
    window:set_config_overrides(opts)
end

function BackDrops:choices()
    local choices = {}
    for idx, file in ipairs(self.images) do
        table.insert(choices, {
            id = tostring(idx),
            label = file:match('([^/]+)$'),
        })
    end
    return choices
end

---@param window any?
function BackDrops:random(window)
    self.current_idx = math.random(#self.images)

    if window ~= nil then
        self:_set_opt(window, self:_create_opts())
    end
end

---@param window any WezTerm
function BackDrops:cycle_forward(window)
    if self.current_idx == #self.images then
        self.current_idx = 1
    else
        self.current_idx = self.current_idx + 1
    end
    self:_set_opt(window, self:_create_opts())
end

---@param window any WezTerm
function BackDrops:cycle_back(window)
    if self.current_idx == 1 then
        self.current_idx = #self.images
    else
        self.current_idx = self.current_idx - 1
    end
    self:_set_opt(window, self:_create_opts())
end

---@param window any
---@param idx number index of the `files` array
function BackDrops:set_img(window, idx)
    if idx > #self.images or idx < 0 then
        wezterm.log_error('Index out of range')
        return
    end

    self.current_idx = idx
    self:_set_opt(window, self:_create_opts())
end

---@param window any WezTerm
function BackDrops:toggle_focus(window)
    local background_opts

    if self.focus_on then
        background_opts = self:_create_opts()
        self.focus_on = false
    else
        background_opts = self:_create_focus_opts()
        self.focus_on = true
    end

    self:_set_opt(window, background_opts)
end

return BackDrops:init()
