# WezTerm

Primary terminal emulator. Config: `.wezterm.lua` (symlinked from
`~/.wezterm.lua`).

- Catppuccin Mocha (Gogh) scheme, JetBrains Mono at 19pt
- 80% opacity with blur, no tab bar, resize-only decorations
- Custom asymmetric window padding

## Key bindings (pane splits)

Built on Cmd+Shift (comfortable, and free of AeroSpace's Alt family / Ctrl+Cmd).

| Action                | Binding              |
|-----------------------|----------------------|
| Split right           | `Cmd+Shift+\`        |
| Split down            | `Cmd+Shift+/`        |
| Move between panes    | `Cmd+Shift+arrows`   |
| Resize pane (4 cells) | `Cmd+Option+arrows`  |
| Zoom current pane     | `Cmd+Shift+Z`        |

## Updates

Two layers, both daemon-free:

- **Notify** - WezTerm's built-in checker stays on (daily check). It only
  tells you; it never installs. (`show_update_window` is deprecated and is
  no longer settable.)
- **Install** - the config schedules a silent
  `brew upgrade --cask wezterm@nightly --greedy-latest`
  at most once a week while WezTerm runs. It fires 2 minutes after launch,
  re-checks every 24h, and is stamp-gated via `~/.cache/wezterm-last-upgrade`
  so it never double-fires. Fully detached - never blocks startup or freezes
  the UI. Log: `~/.cache/wezterm-upgrade.log`. New versions apply on next
  relaunch; the running instance is never killed.

Requires the Homebrew-managed install of the nightly build
(`brew install --cask wezterm@nightly`, which install.sh already handles via
the Brewfile). The stable `wezterm` cask is left on the Feb 2024 build, which
loses native macOS rounded corners whenever the window is transparent; that
only works on nightly builds.
