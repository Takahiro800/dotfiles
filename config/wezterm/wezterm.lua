local wezterm = require("wezterm")
local tab = require("tab_title")

local act = wezterm.action

local config = {
	hide_tab_bar_if_only_one_tab = true,
	font = wezterm.font_with_fallback({
		{ family = "Cica", weight = "Bold", stretch = "Normal", style = "Italic" },
		{ family = "Cica", assume_emoji_presentation = true },
	}),
	use_ime = true,
	font_size = 16.0,
	color_scheme = "Everforest Dark (Gogh)",

	-- adjust_window_size_when_changing_font_size = false,

	--背景
	-- window_background_image = "/Users/taemath/.config/wezterm/images/Space_Spiral.png",
	-- window_background_image_hsb = {
	-- 	brightness = 0.1,
	-- 	hue = 0.9,
	-- 	saturation = 0.9,
	-- },
	window_decorations = "RESIZE",

	-- alt-keyを有効にする
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,

	-- keys mappings
	leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 },

	keys = {
		{ key = "h", mods = "CMD", action = act.ActivateTabRelative(-1) },
		{ key = "l", mods = "CMD", action = act.ActivateTabRelative(1) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "s", mods = "LEADER", action = act.QuickSelect },

		-- tmux
		{ key = "m", mods = "CTRL", action = act.SendKey({ key = "=" }) },
		{ key = "i", mods = "CTRL", action = act.SendKey({ key = "-" }) },
	},

	colors = {
		tab_bar = {
			background = "#1b1f2f",

			active_tab = {
				bg_color = "#444b71",
				fg_color = "#c6c8d1",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},

			inactive_tab = {
				bg_color = "#282d3e",
				fg_color = "#c6c8d1",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},

			inactive_tab_hover = {
				bg_color = "#1b1f2f",
				fg_color = "#c6c8d1",
				intensity = "Normal",
				underline = "None",
				italic = true,
				strikethrough = false,
			},
		},
	},
}

tab.apply_to_config(config)
return config
