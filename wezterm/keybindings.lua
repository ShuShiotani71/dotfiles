local wezterm = require("wezterm")
local act = wezterm.action

-- Show which key table is active in the top right corner
-- keytable is a certain set of keyboard commands that are only valid when a certain mode is activated eg copy mode, etc
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

-- actual keymap definition
return {
	keys = {
		{
			-- switch workspace (a named collection of tabs and panes)
			key = "w",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
		},
		{
			-- rename workspace
			-- this is insanely weird but just as in the case with leader+shift+w, you need a shift for the modifier to trigger $
			-- even if its not shifted on, say, a custom keyboard
			key = "$",
			mods = "LEADER|SHIFT",
			action = act.PromptInputLine({
				description = "(wezterm) Set workspace title:",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
			}),
		},
		{
			key = "W",
			mods = "LEADER|SHIFT",
			action = act.PromptInputLine({
				description = "(wezterm) Create new workspace:",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(
							act.SwitchToWorkspace({
								name = line,
							}),
							pane
						)
					end
				end),
			}),
		},

		-- Move between tabs
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
		-- Swap tabs
		{ key = "{", mods = "LEADER", action = act({ MoveTabRelative = -1 }) },
		{ key = "}", mods = "LEADER", action = act({ MoveTabRelative = 1 }) },
		-- Create new tab
		{ key = "t", mods = "CTRL", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		-- Close tab (using ctrl+shift since ctrl+w is leader for window management in nvim and this cannot be changed)
		{ key = "w", mods = "CTRL|SHIFT", action = act({ CloseCurrentTab = { confirm = true } }) },

		-- Make tab full screen
		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },

		-- activate copy mode
		-- ActivateCopyMode is internally linked to keytable named copy_mode, so it knows that its linked to that
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
		-- copy, works both in copy mode as well as by highlighting using mouse in normal mode
		{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },

		-- Create pane
		{ key = "d", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "r", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		-- Close pane
		{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
		-- Move pane
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		-- Select pane
		{ key = "[", mods = "CTRL|SHIFT", action = act.PaneSelect },
		-- Only show selected pane
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

		-- Change font size
		{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		-- Reset font size
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },

		-- Switch tabs
		{ key = "1", mods = "SUPER", action = act.ActivateTab(0) },
		{ key = "2", mods = "SUPER", action = act.ActivateTab(1) },
		{ key = "3", mods = "SUPER", action = act.ActivateTab(2) },
		{ key = "4", mods = "SUPER", action = act.ActivateTab(3) },
		{ key = "5", mods = "SUPER", action = act.ActivateTab(4) },
		{ key = "6", mods = "SUPER", action = act.ActivateTab(5) },
		{ key = "7", mods = "SUPER", action = act.ActivateTab(6) },
		{ key = "8", mods = "SUPER", action = act.ActivateTab(7) },
		{ key = "9", mods = "SUPER", action = act.ActivateTab(-1) },

		-- activate command palette
		{ key = "p", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
		-- reload settings
		{ key = "r", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },

		-- activate resize_pane keytable
		{ key = "s", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
		-- activate activate_pane keytable
		{
			key = "a",
			mods = "LEADER",
			action = act.ActivateKeyTable({ name = "activate_pane", timeout_milliseconds = 1000 }),
		},
	},

	-- keytables
	-- https://wezfurlong.org/wezterm/config/key-tables.html
	key_tables = {
		-- for resizing pane, activate by leader + s
		resize_pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
			-- Cancel the mode by pressing escape
			{ key = "Enter", action = "PopKeyTable" },
		},

		activate_pane = {
			{ key = "h", action = act.ActivatePaneDirection("Left") },
			{ key = "l", action = act.ActivatePaneDirection("Right") },
			{ key = "k", action = act.ActivatePaneDirection("Up") },
			{ key = "j", action = act.ActivatePaneDirection("Down") },
		},

		-- copy_mode, activate by: leader + [
		-- not that copy mode is simply select text using visual mode,
		-- then use motion to hightlight whatever test you want, then press y to yank.
		-- you cannot do stuff like y$ to copy till end
		copy_mode = {
			-- vertical/horizontal navigation
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			-- beginning/end of line
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			-- Move to LHS
			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
			-- Move by space separation
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
			-- Jumping till certain characters
			{ key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
			{ key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
			{ key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			-- Start/end
			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
			-- HML
			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			-- Page navigation
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
			{ key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
			{ key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
			-- Visual mode (for the actual selecting)
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			-- copy (not that this does not end copy_mode, you have to end by pressing enter, esc, etc)
			{ key = "y", mods = "NONE", action = act.CopyTo("Clipboard") },

			-- finish copy_mode
			-- confirm selection
			{
				key = "Enter",
				mods = "NONE",
				action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
			},
			-- end without confirming selection
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
		},
	},
}
