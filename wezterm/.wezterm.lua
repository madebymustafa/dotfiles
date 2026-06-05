-- =============================================================================
--  Wezterm terminal emulator configuration
-- =============================================================================

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ─── Updates ────────────────────────────────────────────────────────────────

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
config.show_update_window = false

-- ─── Appearance ─────────────────────────────────────────────────────────────

config.color_scheme = "Catppuccin Mocha (Gogh)"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 19
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
config.window_padding = { left = 27, right = 10, top = 20, bottom = 0 }

-- ─── Cursor ─────────────────────────────────────────────────────────────────

config.default_cursor_style = "BlinkingUnderline"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- ─── Startup position ───────────────────────────────────────────────────────
-- Launch at 60% of screen size, centred on the active display.

wezterm.on("gui-startup", function()
	local screen = wezterm.gui.screens().active
	local ratio = 0.6
	local width = screen.width * ratio
	local height = screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window({
		position = {
			x = (screen.width - width) / 2,
			y = (screen.height - height) / 2,
			origin = "ActiveScreen",
		},
	})
	window:gui_window():set_inner_size(width, height)
end)

return config
