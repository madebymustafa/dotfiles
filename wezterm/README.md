# WezTerm

Primary terminal emulator. Config: `.wezterm.lua` (symlinked from
`~/.wezterm.lua`).

- Catppuccin Mocha (Gogh) scheme, JetBrains Mono at 19pt
- 80% opacity with blur, no tab bar, resize-only decorations
- Custom asymmetric window padding

## Updates

Two layers, both daemon-free:

- **Notify** - WezTerm's built-in checker stays on (daily check, visible
  update window). It only tells you; it never installs.
- **Install** - the config schedules a silent `brew upgrade --cask wezterm`
  at most once a week while WezTerm runs. It fires 2 minutes after launch,
  re-checks every 24h, and is stamp-gated via `~/.cache/wezterm-last-upgrade`
  so it never double-fires. Fully detached - never blocks startup or freezes
  the UI. Log: `~/.cache/wezterm-upgrade.log`. New versions apply on next
  relaunch; the running instance is never killed.

Requires the Homebrew-managed install (`brew install --cask wezterm`,
which install.sh already handles).
