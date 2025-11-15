-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
-- config.font = wezterm.font 'CaskaydiaCove Nerd Font'
-- config.font = wezterm.font("FiraCode Nerd Font Mono")
-- config.font = wezterm.font("RobotoMono Nerd Font")
config.font = wezterm.font("BitstromWera Nerd Font Mono")
-- config.color_scheme = 'Adventure'
-- config.color_scheme = 'Alabaster'
-- config.color_scheme = 'Github'
-- config.color_scheme = 'AtomOneLight'
config.color_scheme = 'iceberg-light'
-- config.color_scheme = 'iceberg'
-- config.color_scheme = "Atom"
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Everforest Light (Gogh)'
-- config.color_scheme = 'Catppuccin Latte'
-- config.color_scheme = 'Ayu Light (Gogh)'

-- config.window_background_opacity = 0.85
local act = wezterm.action

-- 36 is the default, but you can choose a different size.
-- Uses the same font as window_frame.font if pane_select_font option is not set
-- config.pane_select_font_size=36,

config.keys = {
	-- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
	{ key = "8", mods = "CTRL", action = act.PaneSelect },
	-- activate pane selection mode with numeric labels
	{
		key = "9",
		mods = "CTRL",
		action = act.PaneSelect({
			alphabet = "1234567890",
		}),
	},
	-- show the pane selection mode, but have it swap the active and selected panes
	{
		key = "0",
		mods = "CTRL",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
}

config.hide_tab_bar_if_only_one_tab = true
-- Finally, return the configuration to wezterm:
return config
