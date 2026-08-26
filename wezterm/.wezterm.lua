-- =============================================================================
--  Wezterm terminal emulator configuration
-- =============================================================================

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ─── Updates ────────────────────────────────────────────────────────────────

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
config.show_update_window = true

-- Installs wezterm updates automatically via Homebrew, at most once a week.
-- Runs detached from within WezTerm: no login item, no launch agent, no
-- blocking. New version takes effect the next time WezTerm is relaunched.
-- Activity log: ~/.cache/wezterm-upgrade.log

local BREW = "/opt/homebrew/bin/brew"
local STAMP = wezterm.home_dir .. "/.cache/wezterm-last-upgrade"
local LOG = wezterm.home_dir .. "/.cache/wezterm-upgrade.log"

local function outdated_stamp()
	local f = io.open(STAMP, "r")
	if not f then
		return true
	end
	local last = tonumber(f:read("l")) or 0
	f:close()
	return os.time() - last > 7 * 24 * 60 * 60
end

local function run_silent_update()
	os.execute(string.format(
		"(mkdir -p %q; "
			.. "if out=$(%s outdated --cask --quiet --greedy); then "
			.. "if echo \"$out\" | grep -q '^wezterm'; then %s upgrade --cask wezterm; fi; "
			.. "date +%%s > %q; fi) >> %q 2>&1 &",
		wezterm.home_dir .. "/.cache",
		BREW,
		BREW,
		STAMP,
		LOG
	))
end

if not wezterm.GLOBAL.wezterm_auto_update_armed then
	wezterm.GLOBAL.wezterm_auto_update_armed = true

	local function arm(delay)
		wezterm.time.call_after(delay, function()
			if outdated_stamp() then
				run_silent_update()
			end
			arm(24 * 60 * 60)
		end)
	end

	arm(120)
end

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
