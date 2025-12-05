-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux


local is_windows = wezterm.target_triple:find("windows") ~= nil-- This will hold the configuration.
local config = wezterm.config_builder()

wezterm.on('gui-startup', function(cmd)
  local args = {}
  if cmd then
    args = cmd.args
  end

  -- set workspace 1
  local tab, pane, window = mux.spawn_window {
    workspace = 'main',
    args = args,
  }

  local tab, pane, window = mux.spawn_window {
    workspace = 'dev',
    args = args,
  }

  local tab, pane, window = mux.spawn_window {
    workspace = 'tools',
    args = args,
  }

  local tab, pane, window = mux.spawn_window {
    workspace = 'AI',
    args = args,
  }

  mux.set_active_workspace 'main'
end)

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
if is_windows then
  config.font = wezterm.font("BitstromWera Nerd Font")
else
  config.font = wezterm.font("BitstreamVeraSansMono Nerd Font Mono")
end

-- dark colorscheme
-- config.color_scheme = "Atom"
config.color_scheme = "Catppuccin Mocha"

-- config.window_background_opacity = 0.90
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

config.leader = { key = "Space", mods = 'CTRL', timeout_millliseconds = 1000 }
config.keys = {
  -- splitting
  {
    mods = "LEADER",
    key = "-",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    mods = "LEADER",
    key = "=",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  }
}


config.hide_tab_bar_if_only_one_tab = true
-- Finally, return the configuration to wezterm:
return config
