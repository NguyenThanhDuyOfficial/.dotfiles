-- MY CONFIG

-- ENV
hl.env("EDITOR", "nvim")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NVD_BACKEND", "direct")
hl.env("QT_IM_MODULE", "fcitx")

-- MONITOR
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- EXEC-ONE
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprctl setcursor FernBLZ 24")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("awww-daemon && sleep 1s && ~/.config/scripts/wallpapers.sh")
	hl.exec_cmd("qs")
	hl.exec_cmd("alacritty --daemon --socket /tmp/alacritty.sock")
end)

-- CONFIG
local theme = require("theme")

hl.config({
	general = {
		border_size = 4,

		gaps_in = 6,
		gaps_out = 12,

		col = {
			inactive_border = theme.mantle,
			active_border = { colors = { theme.mauve, theme.blue }, angle = 45 },
		},

		layout = "dwindle",

		resize_on_border = true,

		-- TODO: snap
	},
	decoration = {
		rounding = 4,
		active_opacity = 0.90,
		inactive_opacity = 0.85,
		fullscreen_opacity = 1,

		blur = {
			enabled = true,
			size = 4,
			passes = 1,
			new_optimizations = true,
			xray = true,
			noise = 0.0117,
			contrast = 0.8916 * 1,
			-- brightness = 0.8172 * 1,
			brightness = 0.8172,
			vibrancy = 0.1676,
		},
		shadow = {
			enabled = true,
			range = 8,
			render_power = 4,
			sharp = false,
		},
		glow = {
			enabled = true,
			range = 8,
			render_power = 1,
			color = theme.mauve,
			color_inactive = theme.overlay1,
		},
	},

	input = {
		kb_options = "caps:super",
		-- TODO: xkb file
	},

	misc = {
		disable_hyprland_logo = true,
	},

	master = {
		new_status = "slave",
	},
})

-- ANIMATION
-- TODO: animation
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- WINDOW RULE
hl.window_rule({
	name = "waydroid",
	match = {
		class = "Waydroid",
	},
	opacity = "1 override",
})
hl.window_rule({
	name = "terminal",
	match = {
		initial_class = "Alacritty",
	},
	no_blur = true,
})
hl.window_rule({
	name = "youtube",
	match = {
		title = ".*(YouTube|youtube).*",
	},
	opacity = "1 override",
	no_blur = true,
})
hl.window_rule({
	name = "zen",
	match = {
		initial_class = "zen",
	},
	opacity = "1 override",
	no_blur = true,
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "picture in picture",
	match = { initial_title = "Picture-in-Picture" },
	float = true,
	move = { "(monitor_w - 320 - 8)", "(monitor_h - 180 - 8 )" },
	size = "320 180",
	pin = true,
})

-- KEYBINDINGS

local mainMod = "SUPER"

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("alacritty msg create-window || alacritty"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- hl.bind("F9", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind("F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))

hl.bind(mainMod .. " + P", hl.dsp.submap("pomodoro"))

hl.define_submap("pomodoro", function()
	hl.bind("C", hl.dsp.global("quickshell:timer_close"))
	hl.bind("O", hl.dsp.global("quickshell:timer_open"))
	hl.bind("S", hl.dsp.global("quickshell:timer_stop"))
	hl.bind("R", hl.dsp.global("quickshell:timer_run"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. " + V", function()
	hl.dispatch(hl.dsp.exec_cmd("qs ipc call popupVolume toggleVolume"))
	hl.dispatch(hl.dsp.submap("volume"))
end)
-- Submap

hl.define_submap("volume", function()
	hl.bind("up", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
	hl.bind("down", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
	hl.bind("K", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
	hl.bind("J", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
	hl.bind("mouse_down", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
	hl.bind("mouse_up", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

	hl.bind("escape", function()
		hl.dispatch(hl.dsp.exec_cmd("qs ipc call popupVolume toggleVolume"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
end)

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
-- hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
