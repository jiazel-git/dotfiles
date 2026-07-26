-- Hyprland Startup Apps Module

----------------------------
---- STARTUP APPS ----
----------------------------

hl.on("hyprland.start", function()
	-- Wallpaper daemon
	hl.exec_cmd("awww-daemon --format xrgb")

	-- DBus and environment
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- Keybinds layout init
	hl.exec_cmd(scriptsDir .. "/KeybindsLayoutInit.sh")

	-- Polkit
	hl.exec_cmd(scriptsDir .. "/Polkit.sh")

	-- Startup apps
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("nm-tray")
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("qs -c overview")

	-- Clipboard manager
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Rainbow borders
	hl.exec_cmd(UserScripts .. "/RainbowBorders.sh")

	-- Hypridle
	hl.exec_cmd("hypridle")

	-- Hyprsunset init
	hl.exec_cmd(scriptsDir .. "/Hyprsunset.sh init")

	-- Bluetooth
	hl.exec_cmd("blueman-applet")

	-- Input method
	hl.exec_cmd("fcitx5 -d")
end)

----------------------------
---- WORKSPACE RULES ----
----------------------------

-- (mostly defaults from nwg-displays, no active rules)
