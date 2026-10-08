local wezterm = require("wezterm")

local config = wezterm.config_builder()
local opacity = 0.6

wezterm.on("gui-startup", function()
	local first_tab, pane, window = wezterm.mux.spawn_window({})
	local second_tab, _, _ = window:spawn_tab({})

	local gui_window = window:gui_window()
	gui_window:maximize()
	-- gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)

	first_tab:activate()
	pane:send_text("distrobox enter arch\n")
end)

wezterm.on("window-config-reloaded", function(window, pane)
	-- approximately identify this gui window, by using the associated mux id
	local id = tostring(window:window_id())

	-- maintain a mapping of windows that we have previously seen before in this event handler
	local seen = wezterm.GLOBAL.seen_windows or {}
	-- set a flag if we haven't seen this window before
	local is_new_window = not seen[id]
	-- and update the mapping
	seen[id] = true
	wezterm.GLOBAL.seen_windows = seen

	-- now act upon the flag
	if is_new_window then
		window:maximize()
	end
end)

config.tab_max_width = 64
config.show_tab_index_in_tab_bar = false

wezterm.on("window-focus-changed", function(window, pane)
	local overrides = window:get_config_overrides() or {}

	if window:is_focused() then
		overrides.window_background_opacity = 0.8
	else
		overrides.window_background_opacity = opacity
	end

	window:set_config_overrides(overrides)
end)

config.window_background_opacity = opacity
config.macos_window_background_blur = 30

config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }),
	},
	{
		key = "Escape",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "D",
		mods = "CTRL|ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "H",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "J",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "K",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "L",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "H",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({ direction = "Left" }),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({ direction = "Down" }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({ direction = "Up" }),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({ direction = "Right" }),
	},
	{
		key = "H",
		mods = "CTRL|SHIFT|ALT|SUPER",
		action = wezterm.action.SplitPane({ direction = "Left", top_level = true }),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT|ALT|SUPER",
		action = wezterm.action.SplitPane({ direction = "Down", top_level = true }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT|ALT|SUPER",
		action = wezterm.action.SplitPane({ direction = "Up", top_level = true }),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT|ALT|SUPER",
		action = wezterm.action.SplitPane({ direction = "Right", top_level = true }),
	},
}

config.font = wezterm.font_with_fallback({ "Fira Code Nerd Font", "Noto Color Emoji" })

--config.audible_bell = "Disabled"
--wezterm.on('bell', function(window, pane)
--    wezterm.background_child_process({ 'flatpak-spawn', '--host', 'paplay', '/usr/share/sounds/ocean/stereo/bell-window-system.oga' })
--end)

return config
