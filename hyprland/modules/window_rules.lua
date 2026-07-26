-- Hyprland Window Rules Module

-----------------------
---- WINDOW RULES ----
-----------------------

-- Browser tags
hl.window_rule({
	match = { class = "^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$" },
	tag = "+browser",
	workspace = 2,
})
hl.window_rule({ match = { class = "^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$" }, tag = "+browser", workspace = 2 })
hl.window_rule({ match = { class = "^chrome-.+-Default$" }, tag = "+browser", workspace = 2 })
hl.window_rule({ match = { class = "^([Cc]hromium)$" }, tag = "+browser", workspace = 2 })
hl.window_rule({
	match = { class = "^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$" },
	tag = "+browser",
	workspace = 2,
})
hl.window_rule({ match = { class = "^Brave-browser(-beta|-dev|-unstable)?$" }, tag = "+browser", workspace = 2 })
hl.window_rule({ match = { class = "^([Tt]horium-browser|[Cc]achy-browser)$" }, tag = "+browser", workspace = 2 })
hl.window_rule({ match = { class = "^zen-alpha|zen$" }, tag = "+browser", workspace = 2 })

-- Notification tags
hl.window_rule({
	match = { class = "^swaync-control-center|swaync-notification-window|swaync-client|class$" },
	tag = "+notif",
})

-- KooL settings (merged)
hl.window_rule({
	match = { title = "^KooL Quick Cheat Sheet$" },
	tag = "+KooL_Cheat",
	float = true,
	center = true,
	size = "(monitor_w*0.65) (monitor_h*0.9)",
})
hl.window_rule({ match = { title = "^KooL Hyprland Settings$" }, tag = "+KooL_Settings", float = true, center = true })
hl.window_rule({ match = { class = "^nwg-displays|nwg-look$" }, tag = "+KooL-Settings", float = true, center = true })

-- Terminal tags
hl.window_rule({ match = { class = "^Alacritty|wezterm$" }, tag = "+terminal" })

-- Email tags
hl.window_rule({ match = { class = "^([Tt]hunderbird|org.gnome.Evolution)$" }, tag = "+email" })
hl.window_rule({ match = { class = "^eu.betterbird.Betterbird$" }, tag = "+email" })

-- Project tags
hl.window_rule({ match = { class = "^codium|codium-url-handler|VSCodium$" }, tag = "+projects" })
hl.window_rule({ match = { class = "^VSCode|code|code-url-handler$" }, tag = "+projects" })
hl.window_rule({ match = { class = "^jetbrains-.+$" }, tag = "+projects" })

-- Screenshare tags
hl.window_rule({ match = { class = "^com.obsproject.Studio$" }, tag = "+screenshare" })

-- IM tags
hl.window_rule({ match = { class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop$" }, tag = "+im", float = true })
hl.window_rule({ match = { class = "^([Ff]erdium)$" }, tag = "+im", float = true })
hl.window_rule({ match = { class = "^([Ww]hatsapp-for-linux)$" }, tag = "+im", float = true })
hl.window_rule({ match = { class = "^ZapZap|com.rtosta.zapzap$" }, tag = "+im", float = true })
hl.window_rule({
	match = { class = "^org.telegram.desktop|io.github.tdesktop_x64.TDesktop$" },
	tag = "+im",
	float = true,
})
hl.window_rule({ match = { class = "^teams-for-linux$" }, tag = "+im", float = true })
hl.window_rule({ match = { class = "^im.riot.Riot|Element$" }, tag = "+im", float = true })
hl.window_rule({ match = { class = "^Bytedance-feishu$" }, tag = "+im", float = true })

-- File manager tags
hl.window_rule({ match = { class = "^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$" }, tag = "+file-manager" })
hl.window_rule({ match = { class = "^app.drey.Warp$" }, tag = "+file-manager" })

-- Wallpaper (merged)
hl.window_rule({
	match = { class = "^([Ww]aytrogen)$" },
	tag = "+wallpaper",
	float = true,
	opacity = "0.9 0.7",
	size = "(monitor_w*0.7) (monitor_h*0.7)",
})

-- Multimedia tags
hl.window_rule({ match = { class = "^([Aa]udacious)$" }, tag = "+multimedia" })
hl.window_rule({ match = { class = "^([Mm]pv|vlc)$" }, tag = "+multimedia_video", no_blur = true, opacity = "1.0 1.0" })

-- Settings (merged)
hl.window_rule({ match = { title = "^ROG Control$" }, tag = "+settings", float = true, center = true })
hl.window_rule({ match = { class = "^wihotspot(-gui)?$" }, tag = "+settings", float = true })
hl.window_rule({ match = { class = "^([Bb]aobab|org.gnome.[Bb]aobab)$" }, tag = "+settings", float = true })
hl.window_rule({ match = { class = "^gnome-disks|wihotspot(-gui)?$" }, tag = "+settings", float = true })
hl.window_rule({ match = { title = "Kvantum Manager" }, tag = "+settings", float = true })
hl.window_rule({ match = { class = "^file-roller|org.gnome.FileRoller$" }, tag = "+settings", float = true })
hl.window_rule({
	match = { class = "^nm-applet|nm-connection-editor|blueman-manager$" },
	tag = "+settings",
	float = true,
})
hl.window_rule({
	match = { class = "^pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol$" },
	tag = "+settings",
	float = true,
	center = true,
})
hl.window_rule({ match = { class = "^qt5ct|qt6ct|[Yy]ad$" }, tag = "+settings", float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, tag = "+settings", float = true })
hl.window_rule({ match = { class = "^org.kde.polkit-kde-authentication-agent-1$" }, tag = "+settings", float = true })
hl.window_rule({ match = { class = "^([Rr]ofi)$" }, tag = "+settings", float = true })

-- Viewer (merged)
hl.window_rule({
	match = { class = "^gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter$" },
	tag = "+viewer",
	float = true,
})
hl.window_rule({ match = { class = "^evince$" }, tag = "+viewer", float = true })
hl.window_rule({ match = { class = "^eog|org.gnome.Loupe$" }, tag = "+viewer", float = true })

-- KooL Cheat Sheet position
hl.window_rule({ match = { class = "([Tt]hunar)", title = "negative(.*[Tt]hunar.*)" }, center = true, float = true })

-- Idle inhibit for fullscreen
hl.window_rule({ match = { fullscreen = true }, idle_inhibit = "fullscreen" })

-- Float popups and dialogue
hl.window_rule({ match = { title = "^Authentication Required$" }, float = true, center = true })
hl.window_rule({
	match = { class = "codium|codium-url-handler|VSCodium", title = "negative(.*codium.*|.*VSCodium.*)" },
	float = true,
})
hl.window_rule({
	match = { class = "^com.heroicgameslauncher.hgl$", title = "negative(Heroic Games Launcher)" },
	float = true,
})
hl.window_rule({ match = { class = "^([Ss]team)$", title = "negative(^([Ss]team)$)" }, float = true })
hl.window_rule({ match = { class = "([Tt]hunar)", title = "negative(.*[Tt]hunar.*)" }, float = true })
hl.window_rule({
	match = { title = "^Add Folder to Workspace$" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
	center = true,
})
hl.window_rule({
	match = { title = "^Save As$" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
	center = true,
})
hl.window_rule({ match = { initial_title = "Open Files" }, float = true, size = "(monitor_w*0.7) (monitor_h*0.6)" })
hl.window_rule({
	match = { title = "^SDDM Background$" },
	float = true,
	center = true,
	size = "(monitor_w*0.16) (monitor_h*0.12)",
})
hl.window_rule({
	match = { class = "^yad$", title = "^YAD$" },
	float = true,
	center = true,
	size = "(monitor_w*0.2) (monitor_h*0.2)",
})

-- Opacity rules
hl.window_rule({ match = { tag = "browser" }, opacity = "0.99 0.8" })
hl.window_rule({ match = { tag = "projects" }, opacity = "0.9 0.8" })
hl.window_rule({ match = { tag = "im" }, opacity = "0.94 0.86" })
hl.window_rule({ match = { tag = "multimedia" }, opacity = "0.94 0.86" })
hl.window_rule({ match = { tag = "file-manager" }, opacity = "0.9 0.8" })
hl.window_rule({ match = { tag = "terminal" }, opacity = "0.9 0.7" })
hl.window_rule({ match = { tag = "settings" }, opacity = "0.8 0.7" })
hl.window_rule({ match = { tag = "viewer" }, opacity = "0.82 0.75" })
hl.window_rule({ match = { class = "^(gedit|org.gnome.TextEditor|mousepad)$" }, opacity = "0.8 0.7" })
hl.window_rule({ match = { class = "^(deluge)$" }, opacity = "0.9 0.8" })
hl.window_rule({ match = { class = "^(seahorse)$" }, opacity = "0.9 0.8" })

-- Size rules
hl.window_rule({
	match = { class = "^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" },
	size = "(monitor_w*0.6) (monitor_h*0.7)",
})
hl.window_rule({ match = { class = "^([Ff]erdium)$" }, size = "(monitor_w*0.6) (monitor_h*0.7)" })

-- Picture-in-Picture (merged)
hl.window_rule({
	match = { title = "^Picture-in-Picture$" },
	float = true,
	pin = true,
	keep_aspect_ratio = true,
	move = "72% 7%",
	opacity = "0.95 0.75",
})

-- Blur & fullscreen
hl.window_rule({ match = { tag = "games" }, no_blur = true, fullscreen = true })

-- JetBrains no initial focus
hl.window_rule({ match = { class = "^jetbrains-.*" }, no_initial_focus = true })
hl.window_rule({ match = { title = "^wind.*$" }, no_initial_focus = true })

-- Suppress maximize events
hl.window_rule({ name = "suppress-maximize-events", match = { class = ".*" }, suppress_event = "maximize" })

-- Fix XWayland dragging
hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

-- Hyprland-run
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

---------------------
---- LAYER RULES ----
---------------------

hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "quickshell:overview" }, blur = true, ignore_alpha = 0.5 })
