-- Hyprland Settings Module (Misc, Binds, XWayland, Render, Cursor)

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 2,
		mouse_move_enables_dpms = true,
		enable_swallow = false,
		swallow_regex = "^(wezterm)$",
		focus_on_activate = false,
		initial_workspace_tracking = 0,
		middle_click_paste = false,
		enable_anr_dialog = true,
		anr_missed_pings = 15,
		allow_session_lock_restore = true,
		animate_manual_resizes = true,
		force_default_wallpaper = -1,
	},

	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},

	render = {
		direct_scanout = 0,
	},

	cursor = {
		sync_gsettings_theme = true,
		no_hardware_cursors = 2,
		enable_hyprcursor = true,
		warp_on_change_workspace = 2,
		no_warps = true,
	},
})
