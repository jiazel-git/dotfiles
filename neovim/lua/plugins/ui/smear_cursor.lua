local _Opts = {}
_Opts = {
    particles_enabled = true,
    particle_max_num = 200,
    stiffness = 0.5,
    trailing_stiffness = 0.2,
    trailing_exponent = 5,
    damping = 0.6,
    gradient_exponent = 0,
}

return {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = _Opts,
}
