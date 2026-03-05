local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = true -- for japanese
config.window_background_opacity = 1
config.color_scheme = "Tokyo Night Moon"
-- config.font = wezterm.font("JetBrains Mono")

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 480
config.mux_enable_ssh_agent = false -- wezterm tries to mess with ssh
config.initial_cols = 100
config.initial_rows = 24

----------------------------------------------------
-- Tab
----------------------------------------------------
config.show_tabs_in_tab_bar = true

-- Remove tab bar background
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- Change color of borders to match nvim theme
config.window_background_gradient = {
	-- color obtained from: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_moon.lua
	colors = { "#222436" }, -- tokyo night moon bg color
}

-- hide new tab + button
config.show_new_tab_button_in_tab_bar = false
-- Only workd with nightly version
-- hide x button for closing tabs
config.show_close_tab_button_in_tabs = false

-- Hide boundary between tabs
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

-- Change tab shape
-- LHS
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- RHS
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#3b4261"
	local foreground = "#FFFFFF"
	local edge_background = "none"
	if tab.is_active then
		background = "#ff966c"
		foreground = "#3b4261"
	end
	local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

----------------------------------------------------
-- keybindings
----------------------------------------------------
-- config.disable_default_key_bindings = true
-- config.keys = require("keybindings").keys
-- config.key_tables = require("keybindings").key_tables
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

return config
